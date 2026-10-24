# Changelog

What changed in each release, in short.

## [Unreleased]

## [0.15.1] - 2026-10-24

- **Security** — Next.js 16.4.2 (the advisories of 14 October 2026: remote code execution in image optimisation and in `use cache`, a Server Actions denial of service), Node 22.23.4 in the frontend images (CVE-2026-111497, the bundled Brotli decoder) and follow-redirects 1.16.1 (credentials kept across a cross-origin redirect). The production dependencies audit clean.
- **A rank and a score, side by side** — the ranked list no longer makes you choose between a rank and WSJF, RICE or value over effort. Map a score's fields in Settings › Plan and it sits beside the rank, typed in place; map several and pick one on the page. Ranked by hand, a drag writes the rank and "Rank by WSJF" puts the whole list in the score's order once; where a score ranks the list, its order is written to the rank field when there is one. MoSCoW is a choice, not a box to type in. On files the product holds, scores and the rank are written to the files' own columns. New interface only.

- **Dependencies followed up** — a dependency accepted but planned too late is told to both teams; a declined one is asked again for a later sprint or taken to the RTE; asking a team carries a word for them, and its items are picked by key or by words. An item's side panel shows the answers to its dependencies.
- **Commit in three tabs** — Confidence vote, the ART's risks, and Lock & publish with its checklist.
- **A solution's PI** — a solution ranks its capabilities on its own list, and publishes its own closeout, with the STE's word.
- **Teams** — notifications reach the teams you are in; Your account suggests the teams your work is filed under; who answers a team's dependencies can be its named roles. The ranked list shows each item's envelope where Budget is on. A read-only demo says it is read-only.

## [0.15.0] - 2026-10-15 (never published: its changes ship in 0.15.1)

- **The PI, in five phases** — one PI entry takes a PI from Prepare to Plan, Commit, Run and Close. Work dragged on the PI board is written to Jira at once, as the person who moved it — each person's Jira account is found by their sign-in's email, no app to install — and every move is logged and can be undone. The plan is published as the record and compared with what happened since; teams ask each other for dependencies and accept or decline them; the confidence vote runs live from everyone's phone; the ranked list is scored the project's own way. Board is now called Kanban. New interface only.
- **No licence, 14 days** — an installation that never held a licence and runs more than the free tier covers (more than one project, an ART, a group of teams, an organisation unit) now has 14 days from the day it is first seen there, as a paid licence has after it ends. The banner and Settings › Licence say the day it closes; after it, a key or the free version opens it again. Nothing is deleted.
- **The PI, screen by screen** — every PI page redrawn as planned: the PI board teams by sprints with a ranked tray, the room with each team's people, load and asks, dependencies grouped with a who-needs-whom grid, the vote board, risks as a ROAM board, the running PI against its plan, and a closeout that is the PI's record. Next PI and Capacity are one page, Capacity & readiness; a team reads the PI in its own words; a solution has each ART's commitment and its own closeout.
- **CSV templates with every release** — the template pack (a filled example and empty files with the same columns) is attached to each release and in the public repository's `templates/` folder; the install guide links to it.
- **A risk can threaten several objectives** — on a team's plan, the register and the ART Sync, link a risk to as many of its team's objectives as it puts in danger; it shows under each and still counts once. A locked sync keeps every link it had.
- **The PI planning matrix follows your rule** — a team's cell on the epic-by-team matrix reads committed only where the project's commitment rule says so (otherwise partial, with how many are committed, planned, or not planned), marks where a team's own objective for the epic disagrees with its work, and refreshes as soon as a plan is saved or locked.
- **The PI board fits the window** — the board scrolls on its own with its sprints and rows' names pinned, so its sideways scrollbar is always at the foot of the screen; Display › Wide uses the whole window, and a button beside it shows the board full screen.
- **Rankings keep their decimals** — a Business Ranking of 1.1, 1.2 or 1.6 reads as written on every page and sorts in that order; 2 still reads 2. Dragging an item into a new place writes only that item, a number between its new neighbours (1.4 between 1.2 and 1.6), so the rest of the list keeps its numbers.
- **Settings › Access and Sign-in open on the demo** — on an installation where nobody is asked to sign in (the public demo, a compose stack), who may sign in is now shown instead of an error.

## [0.14.1] - 2026-10-24

- **Security** — Next.js 16.4.2 (the advisories of 14 October 2026: remote code execution in image optimisation and in `use cache`, a Server Actions denial of service), Node 22.23.4 in the frontend images (CVE-2026-111497, the bundled Brotli decoder) and follow-redirects 1.16.1 (credentials kept across a cross-origin redirect). The production dependencies audit clean.

## [0.14.0] - 2026-10-13

- **Jira Data Center** — a Data Center site (9.12 LTS or later; 10.3 LTS included) connects like a Cloud one: give its address and a personal access token, or a username and its password. Every page reads it as it reads Cloud, Advanced Roadmaps teams by their names and stories under their epics by Epic Link. Not on Data Center: Jira Product Discovery, which Atlassian offers on Cloud only.
- **Check what Tekio reads** — Settings › Source asks the connected Jira each question the pages ask (searching, counting, an item's history, a field's options, sprints, people, team names) and says, line by line, what came back. Nothing is written.
- **Your organisation's certificates** — a Jira served with a certificate your company's own authority signed: put that authority's certificate in the `certs` folder beside `docker-compose.yml` and restart. It is trusted beside the public ones.

## [0.13.1] - 2026-10-11

- **Runs on ARM too** — the images are published for Intel and AMD and for ARM (Apple Silicon Macs, ARM servers). 0.13.0's could not be installed on a Mac with Apple Silicon.

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
