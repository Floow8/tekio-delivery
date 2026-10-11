# Tekio Delivery

**Where delivery stands, from team to portfolio** — plans, flow, risks and money,
read from the Jira you already have, or from your own CSV or Excel files. It runs
on your own machine or servers, and your data never leaves them.

- **Live demo, nothing to install:** <https://delivery.tekio.app/demo>
- **Product, pricing and comparisons:** <https://delivery.tekio.app>

![A train's Overview: are we on track, what is happening now, what could stop us, what we promised](https://delivery.tekio.app/shots/overview-full.png)

Every level — a team, a group of teams, an ART, a solution, a value stream, the
portfolio — opens on the same four answers, read from the work itself. Scrum,
Kanban and SAFe side by side, each team as it works.

This repository holds what you need to install it: the installer, the compose
file, the release notes and this guide. The application itself ships as two
Docker images on GitHub's registry; its source code is not published.

---

## What you need

- **Docker with Compose** — Docker Desktop on Windows or macOS, Docker Engine on Linux.
- **2 GB of RAM** and about **5 GB of disk** for the cache.
- **bash and curl** — macOS and Linux have both; on Windows, use WSL.
- **Your own data**, when you are ready: a Jira Cloud account that can read the
  projects you want to measure (no Jira admin rights needed), or your tracker's
  exported files.

## Install

In an empty folder:

```bash
curl -fsSLO https://delivery.tekio.app/install.sh
bash install.sh
```

The installer downloads [`docker-compose.yml`](docker-compose.yml), writes your
secrets to a `.env` file only you can read, and starts the two images. It asks
nothing. Then open the **setup link** it prints:
`http://localhost:3000/setup?code=…`.

The first start downloads about 180 MB (about 800 MB once unpacked), so give it a
minute. Rather do it by hand? [`install.sh`](install.sh) is short, and
[`docker-compose.yml`](docker-compose.yml) says what `.env` holds.

**Nobody signs in at first.** Whoever opens the setup link is the
administrator, so keep it to yourself; without it, the installation opens to
nobody — not even on this machine. To share it with others, set up sign-in
first — see [Signing in](#signing-in). Lost the link? Run `bash install.sh`
again in the same folder: it prints it.

## Your data

The first screen offers two ways to start.

**Connect your work**

- **Jira Cloud** — create an API token at *id.atlassian.com → Security → API
  tokens*, then in **Settings › Source** enter your site
  (`https://yourcompany.atlassian.net`), the account the token belongs to, and the
  token. It is encrypted with your own secret, kept in the installation's volume,
  and never leaves the machine. Read access is enough.
- **Files** — upload CSV or Excel files in **Settings › Source**: your tracker's
  export as it is (Jira, Azure DevOps, Linear, Trello, Asana and more), or the
  three templates filled in. Download the templates there; the filled example
  shows every column.

Then **Settings › Add projects**: tick a project and Tekio reads its issues,
boards, sprints and fields, and proposes the whole setup — its levels, the field
that holds the team, the estimates, which statuses count as in progress — with
the evidence for each. You are asked only what your data leaves open, and a proof
on recent issues runs before it goes live.

**Explore with demo data**

Northwind Maritime, a fictional company: five projects, two ARTs and the
portfolio above them, with a few months of history. Every page says it is a demo.
When you are done, **Remove the demo** and start with your own data — the demo
lives apart from your installation's own database and leaves nothing behind.

## Signing in

Sign-in is set up in **Settings › Sign-in**, by an administrator:

- **Microsoft Entra ID**, **Google**, or any **OpenID Connect** provider (Okta,
  Auth0, Keycloak, authentik, …). The page shows the exact redirect address to
  register at the provider, with the steps for each; paste the client ID and
  secret it gives you.
- **A local password**, as a way in if the provider is ever unreachable.

A provider is tried before sign-in can be required, so nobody locks themselves
out; the person who tried it becomes an administrator. Once sign-in is required,
everyone else who signs in starts as a reader; give them more in
**Settings › Access**.

**On a server**, add this to `.env` before running the installer (or run it
again after):

```bash
TEKIO_BIND=0.0.0.0          # listen beyond this machine
```

The installer then prints the setup link with this machine's address too. Put
HTTPS in front of it (Caddy, nginx, Traefik…) — Google and most providers accept
only HTTPS redirect addresses — and open the link at that address:
`https://tekio.yourcompany.com/setup?code=…`. Until sign-in is required, only
the setup link opens the installation, behind a proxy or not.

**Installed with 0.12.0?** Its administrator keeps signing in with the same
password: **Settings › Sign-in** shows it as the first way in, already required.

Locked out? On the machine itself, `docker compose exec backend python -m
app.sign_in --open` stops requiring sign-in; then open the setup link again.

## Updating

Atlassian changes the Jira API regularly, so an installation that stops getting
updates will eventually break. To update, run the installer again in the
installation's folder:

```bash
bash install.sh
```

It downloads the latest compose file — which names the new version — keeps the
one it replaces as `docker-compose.yml.previous`, keeps `.env`, and starts the
new version. (By hand: `curl -fsSLO https://delivery.tekio.app/docker-compose.yml`,
then `docker compose up -d`.) The database is copied before anything changes
(`backups/` in the data volume), and your configuration and cache are kept. Keep
your own settings in `.env`, never in the compose file. What changed in each
version: [CHANGELOG.md](CHANGELOG.md) and the [releases](../../releases).

## Your installation's data

Everything is in the `tekio-delivery_tekio-data` Docker volume: the settings
database, the cache, uploaded files, and the backups — a copy before every
upgrade and one every night, the last seven kept.

- **Back up now:** `docker compose exec backend python -m app.backup`
- **Remove everything:** `docker compose down -v` in the installation's folder
  deletes the containers *and* the volume. There is no undo.

## The free version and licences

One Scrum or Kanban team is free, with no time limit, as it is and without
support. More than one team — an ART, a group, the portfolio above them, budgets —
needs a licence key, pasted in **Settings › Licence**. A 30-day trial and the
licences are on <https://delivery.tekio.app/en/licence>; prices are on the site.

## If something goes wrong

| Symptom | Usually |
|---|---|
| Blank page on :3000 | Still starting: `docker compose logs -f`. |
| "Open it with its setup link" | Nobody signs in yet: open the link `bash install.sh` prints. |
| "Cannot store token" | `TEKIO_SECRET_KEY` is missing from `.env`. |
| 401 from Jira | The email and the token must belong to the same account. |
| No fields found while adding a project | The account cannot see the project: check its permissions. |
| Charts are empty | The first read is still running — it reads each item's history. |
| "This needs a licence key" | More than one team, or the portfolio: see licences above. |
| The images won't download | This machine cannot reach ghcr.io: copy the two images to your own registry and set `TEKIO_BACKEND_IMAGE` and `TEKIO_FRONTEND_IMAGE` in `.env`. |

## Feedback, bugs and security

- **Bugs and ideas:** [open an issue](../../issues/new/choose). The free version
  comes without support: issues are read, not answered to a deadline.
- **A security problem:** report it privately — see [SECURITY.md](SECURITY.md).

## Licence

Tekio Delivery is proprietary software. Its use is governed by the
[licence conditions](https://delivery.tekio.app/en/terms) — see [LICENSE](LICENSE).
