#!/usr/bin/env bash
# Installs Tekio Delivery in the current folder, or updates and starts it again.
#
#     curl -fsSLO https://delivery.tekio.app/install.sh && bash install.sh
#
# It asks nothing. It downloads docker-compose.yml beside it, writes .env the
# first time — the installation's secrets and its setup code — starts both
# images, and prints the link to open. Nobody signs in at first: whoever opens
# that link administers the installation, until sign-in is required in
# Settings › Sign-in.
#
# Run it again to update to the latest version and start it: .env is kept (a
# setup code is added to one that has none), the compose file it replaces is
# kept as docker-compose.yml.previous, and the link is printed again.
#
# TEKIO_LICENCE, TEKIO_PORT, TEKIO_BIND, TEKIO_BACKEND_IMAGE and
# TEKIO_FRONTEND_IMAGE, when set, are written to a new .env too
# (docker-compose.yml says what each does).
set -euo pipefail

SITE="${TEKIO_SITE:-https://delivery.tekio.app}"
COMPOSE="docker-compose.yml"

say() { printf '%s\n' "$*" >&2; }
fail() {
  say ""
  say "$*"
  exit 1
}

command -v docker >/dev/null 2>&1 ||
  fail "Docker is not installed. Install Docker Desktop (Windows, macOS) or Docker Engine (Linux): https://docs.docker.com/get-docker/"
docker compose version >/dev/null 2>&1 || fail "This needs Docker Compose v2 (the 'docker compose' command)."
docker info >/dev/null 2>&1 || fail "Docker is installed but not running. Start it, then run this again."
command -v curl >/dev/null 2>&1 || fail "This needs curl."

# The latest compose file — which names the latest images. One already here
# that differs is kept beside it; one that cannot be downloaded is used as it is.
if [ "${TEKIO_KEEP_COMPOSE:-}" != "1" ]; then
  if curl -fsSL "$SITE/$COMPOSE" -o "$COMPOSE.download" 2>/dev/null; then
    if [ -f "$COMPOSE" ] && ! cmp -s "$COMPOSE" "$COMPOSE.download"; then
      mv "$COMPOSE" "$COMPOSE.previous"
      say "Updated $COMPOSE (the one it replaces is $COMPOSE.previous)."
    fi
    mv "$COMPOSE.download" "$COMPOSE"
  else
    rm -f "$COMPOSE.download"
    [ -f "$COMPOSE" ] || fail "Could not download $SITE/$COMPOSE."
    say "Could not reach $SITE: starting the $COMPOSE that is here."
  fi
fi

secret() {
  if command -v openssl >/dev/null 2>&1; then
    openssl rand -hex "$1"
  else
    od -An -tx1 -N"$1" /dev/urandom | tr -d ' \n'
  fi
}

if [ -f .env ]; then
  say "Keeping the .env that is here."
  if ! grep -q '^TEKIO_SETUP_CODE=.' .env; then
    echo "TEKIO_SETUP_CODE=$(secret 16)" >>.env
    say "Added a setup code to .env."
  fi
else
  umask 077
  {
    echo "# Written by install.sh on $(date -u +%Y-%m-%d). Keep it private: it holds the keys to everything Tekio stores."
    echo "TEKIO_SECRET_KEY=$(secret 32)"
    echo "BACKEND_AUTH_SECRET=$(secret 32)"
    echo "AUTH_SECRET=$(secret 32)"
    echo "# The setup link's code: until sign-in is required, whoever has the link administers Tekio."
    echo "TEKIO_SETUP_CODE=$(secret 16)"
    for name in TEKIO_LICENCE TEKIO_PORT TEKIO_BIND TEKIO_BACKEND_IMAGE TEKIO_FRONTEND_IMAGE; do
      if [ -n "${!name:-}" ]; then
        echo "$name=${!name}"
      fi
    done
  } >.env
  say "Wrote .env (readable by you alone)."
fi

say "Starting Tekio Delivery (the first time downloads about 180 MB)…"
docker compose pull --quiet >/dev/null 2>&1 || true
docker compose up -d --wait >/dev/null || fail "It did not start. What it says: docker compose logs --tail 50"

value() { sed -n "s/^$1=//p" .env | tail -n 1; }
port="$(value TEKIO_PORT)"
port="${port:-3000}"
bind="$(value TEKIO_BIND)"
code="$(value TEKIO_SETUP_CODE)"

# Whether sign-in is required yet, as the installation itself says.
required="$(docker compose exec -T backend python -m app.sign_in 2>/dev/null | sed -n 's/^Sign-in required: //p' | head -n 1 || true)"

say ""
if [ "$required" = "yes" ]; then
  say "Tekio Delivery is running: http://localhost:$port — sign in."
  exit 0
fi

say "Tekio Delivery is running. Open it with its setup link:"
say ""
say "    http://localhost:$port/setup?code=$code"
case "${bind:-127.0.0.1}" in
  127.0.0.1 | localhost | ::1) ;;
  *)
    address="$( (hostname -I 2>/dev/null || ipconfig getifaddr en0 2>/dev/null || true) | awk '{print $1}')"
    say "    http://${address:-<this machine’s address>}:$port/setup?code=$code   (from another machine)"
    ;;
esac
say ""
say "Nobody signs in yet: whoever opens the link administers Tekio, so keep it"
say "private. Before you share Tekio, set up a way in and require it in"
say "Settings › Sign-in. Lost the link? Run this again: it prints it."
