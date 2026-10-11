# Changelog

What changed in each release, in short.

## [Unreleased]

## [0.13.0] - 2026-10-11

- **Nobody signs in at first** — the installer asks nothing and prints a setup link; whoever opens it administers the installation. Settings › Sign-in sets up Microsoft Entra ID, Google, any OpenID Connect provider or a password, each tried before sign-in can be required. An installation made by 0.12.0's installer keeps its administrator's password, still required.
- **Explore with demo data** — a new installation's first screen offers Northwind Maritime, a fictional company: two ARTs, a Scrum group, a Scrum team, a Kanban team and the portfolio above them. Marked Demo on every page, removed in one click; your own data is never touched.
- **Updates from the installer** — run it again: it fetches the latest compose file and starts the new version.
- **A public home** — the install guide, release notes and issues at github.com/Floow8/tekio-delivery.

## [0.12.0] - 2026-10-10

- **Install on your own machine** — one installer asks who signs in first, keeps the secrets in a local file and starts both images; the installation opens on the new interface.
- **Onboarding by discovery** — connect Jira and pick a project: the configuration is read from your data, and you are asked only what it leaves open.
- **Your files, read as you say** — where an uploaded export has a column the reader cannot place, you say what it holds.
- **Overview at every level** — four answers first: on track, happening now, what could stop us, what was promised. For a team, a group, an ART and a value stream.
- **Notifications** — one page behind the bell for dependencies, risks, syncs, rules, money and requests. Each person chooses what they are told about.
- **PI board** — each ART's epics as bars across the PI's sprints, with the dependencies between them graded; one board across a solution's ARTs.
- **A page per item** — an initiative, a capability or an epic across the PIs and ARTs that carry it, with its cost, risks and dependencies.
- **Portfolio** — its own Overview, board and roadmap; an Inbox that places requests; Alignment of priority, money and time.
- **PI Planning and syncs** — the planning room, each team's plan from planning to scoring, syncs held team by team.
- **Next PI** — how full the next PI is before anybody plans it, team by team.
- **Access** — given area by area, with a default for everyone, activity and history.
- A team's sprints, commitment and flow in its own menu; burn-ups draw the work done and the ideal line.

## [0.11.0] - 2026-10-04

- Work read from Jira Cloud or from a tracker's exported files.
- Sign in with Microsoft Entra ID, any OpenID Connect provider, or a local administrator.
- SAFe, Scrum and Kanban; Scrum and Kanban are free, a licence unlocks SAFe.
- A new interface: menus by question, the organisation from portfolio to team, Budget, and a guide for every page.
- Upgrades copied first and applied in one step; nightly backups; an offline, read-only public demo.

## [0.10.1] - 2026-09-04

- Roles and access, enforced by the server.
- Triage for unplaced work, a request funnel and demand history.
- Delivery Trends across PIs.
- Projects set up from Settings and checked against real data before going live.
- Kanban mode, and each level of the hierarchy can be renamed.

## [0.10.0] - 2026-06-19

- Every figure explains what it is and how it is counted.
- One sprint classification for the board, drift and the sprint report.
- Ranking flows from initiative to epic to team.
- Quality trend across PIs, and compliance filters you can share.

## [0.9.2] - 2026-04-02

- Product launch timeline redesigned.
- Next PI capacity from actual throughput, with carry-over.
- Forecast on the full or the committed scope.

## [0.9.1] - 2026-03-19

- A project can read work from several tracker projects.
- Projects that count epics read their stories as work.

## [0.9.0] - 2026-03-17

- A documentation page explaining every calculation.
- Forecast rewritten with a per-item probability.
- Product launches with development readiness.

## [0.8.0] - 2026-02-25

- Portfolio alignment, board and metrics.
- One prioritization page for epics and teams.

## [0.7.0] - 2026-02-18

- An epic view of the program board.

## [0.6.0] - 2026-02-09

- The program board, initiative details and the sprint report.

## [0.5.0] - 2026-01-08

- Cached responses and background refresh: pages answer in under a second.
- Next PI planning per team, and PI status reports.

## [0.4.1] - 2025-12-22

- Prioritization and next-PI planning pages.

## [0.4.0] - 2025-12-18

- Light and dark themes.
- Portfolio overview and roadmap; a team page with burndown and burn-up.

## [0.3.0] - 2025-12-10

- Portfolio views over the idea projects.
- Commitment by team, committed beside uncommitted.

## [0.2.0] - 2025-12-03

- Several projects, each configured in the product.
- Roadmap, initiatives, teams, flow, forecast and backlog health.

## [0.1.0] - 2025-11-19

- The first dashboard: PI health, epic compliance, feature risk and commitment.
