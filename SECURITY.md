# Security

Please report a vulnerability **privately**, never in a public issue: on this
repository, open **Security → Report a vulnerability**. Say what you found, how
to reproduce it, and which version you run (Settings › System, or
`docker compose images`).

You will get an answer as soon as the report has been read, and credit in the
release notes of the version that fixes it, if you want it.

## How an installation protects itself

- Your data stays on your machine or servers: Tekio Delivery calls nothing but
  the Jira site you connect it to.
- The Jira token is encrypted at rest with your installation's own secret
  (`TEKIO_SECRET_KEY` in `.env`), and never shown again once saved.
- Nobody signs in at first, so until sign-in is required the installation
  opens only with the setup link its installer printed — on its own machine as
  from anywhere else. Before it is reachable by others, an administrator
  requires sign-in (Microsoft Entra ID, Google, OpenID Connect or a local
  password) in Settings › Sign-in.
- Every write is refused unless the person's role allows it, and access is given
  area by area in Settings › Access.
