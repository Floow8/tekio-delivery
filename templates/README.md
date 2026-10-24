# Your work, as CSV files

Upload the files on Settings → Connection, or on the first step of adding a project, and every page reads from them. Or put them in a folder this server reads and name the folder there.

Only the items are required. The status changes and the sprints add what a list of items cannot say: how long work took, and what each sprint committed to and delivered.

An upload is recognised by its header row, whatever the file is called. In a folder, the files are named `issues.csv`, `transitions.csv` and `sprints.csv`; a file in several parts is `issues.csv`, `issues-2.csv`, `issues-3.csv`… and read as one.

Each file's first row is its header. The columns can be in any order, and a column you do not use can be left out or left empty.

A header the product does not know — your own name for the team, a header in French — is not guessed: the upload asks what the file holds and what each of its headers is, and a column read as nothing can be answered on Settings → Connection. The answers are kept with the files, and next week's export with the same headers is read the same way.

## issues.csv — one row per item

The work itself: every item, its type, where it stands and who it belongs to.

| Column | | What it holds | Example |
|---|---|---|---|
| `project` |  | Which project the item belongs to, where one folder holds several. Without the column, every row is the one project. Also read as: project key. | `NW` |
| `key` | required | The item's own key, unique in the folder. Also read as: issue key, work item key, formatted id. | `NW-12` |
| `type` |  | Epic, Story, Bug… — placed at a level on Items & hierarchy. Without it, every item is a Work item. Also read as: issue type, work item type, issuetype, item type, task type. | `Story` |
| `status` | required | Where the item stands now, in your workflow's words. Also read as: state, schedule state, section/column. | `In Progress` |
| `points` |  | Its size, if you size work. Also read as: story points, story point estimate, estimate, effort, size, plan estimate, sprint points. | `3` |
| `team` |  | The team that owns it; several, separated by commas. Also read as: team name, squad, teams, area path. | `Navigation` |
| `epic` |  | The key of the item above it — an epic, an initiative. Also read as: parent, parent key, epic link, parent id, parent link, parent issue, parent task. | `NW-3` |
| `created` |  | When it was created. Also read as: created date, creation date, created on, created at, date created. | `2026-07-02` |
| `started` |  | When work on it started: its first day in progress. With no transitions.csv, started and resolved are the history — the cycle time is the time between them. Also read as: started at, start of work, date started, activated date, in progress date, in-progress date. | `2026-08-12` |
| `resolved` |  | When it was finished, if it is. Also read as: resolution date, resolved date, closed date, done date, completed date, completed at, date done, date closed, accepted date. | `2026-08-20` |
| `summary` |  | Its title. Also read as: title, name, task name, card name. | `Offline sync` |
| `updated` |  | When it last changed. Left empty, its last status change stands in. Also read as: last updated, changed date, last modified, updated at, date updated, last update date, last activity date, date last activity. | `2026-09-01` |
| `pi` |  | The PIs it belongs to, for a team that plans in PIs; several, separated by commas. Also read as: program increment, planning interval, pis. | `PI3` |
| `assignee` |  | Who is working on it. Also read as: assigned to, assignees. | `Priya Raman` |
| `owner` |  | Who answers for it. Also read as: epic owner. | `Yuki Tanaka` |
| `business analyst` |  | Its business analyst. Also read as: analyst. | `Ben Carver` |
| `tech lead` |  | Its technical lead. | `Mert Demir` |
| `rank` |  | Its place in the backlog: 1 is first. | `4` |
| `depends on` |  | The keys of the items that must be done before it; several, separated by commas. The planning board draws each one and grades it against where both are planned. Also read as: depends upon, waits on, blocked by, predecessor, predecessors, inward issue link (blocks). | `NW-10` |

### A portfolio's own columns in issues.csv

On the items above the delivery work — themes, initiatives, capabilities, requests — what the Portfolio pages read. A team without a portfolio leaves them out.

| Column | What it holds | Example |
|---|---|---|
| `horizon` | When the portfolio means to take it on: Now, Next or Later. Also read as: @roadmap, roadmap, now next later. | `Next` |
| `portfolio stage` | Where it stands in the portfolio's flow, in the portfolio's words — Funnel, Exploration, Plan, Build, Deliver. Also read as: @stage, stage. | `Exploration` |
| `moscow` | Its priority: Must, Should, Could or Won't. Also read as: @moscow, priority (moscow). | `Should` |
| `pillar` | The pillar, or line of business, it belongs to. Also read as: platform pillar. | `Vessel Systems` |
| `strategy` | The strategy it serves. Also read as: abc strategy. | `Grow` |
| `buckets` | The buckets it is funded from; several, separated by commas. Also read as: bucket. | `Run` |
| `business unit` | The business unit asking for it. Also read as: bu. | `Fleet` |
| `planned start` | When it is planned to start. | `2026-10-01` |
| `planned end` | When it is planned to finish. | `2027-03-31` |
| `budget` | Its budget, in the portfolio's currency. Also read as: total budget. | `120000` |

### A score's parts in issues.csv

What the ranked list reads beside the rank, and types into: WSJF's four parts or its one number, RICE's four, value and effort. A team that does not score leaves them out.

| Column | What it holds | Example |
|---|---|---|
| `business value` | WSJF: what it is worth to the business, on the team's scale (1, 2, 3, 5, 8, 13, 20). Also read as: user business value, wsjf business value. | `8` |
| `time criticality` | WSJF: how much its value decays while it waits. | `5` |
| `risk reduction` | WSJF: the risk it reduces or the opportunity it enables. Also read as: risk reduction opportunity enablement, risk reduction | opportunity enablement, rr oe, rroe. | `3` |
| `job size` | WSJF: how big it is, on the same scale — what the three above are divided by. | `5` |
| `wsjf` | WSJF as one number, where the team keeps it computed. Also read as: wsjf score. | `3.2` |
| `reach` | RICE: how many it reaches in a period. Also read as: rice reach. | `800` |
| `impact` | RICE: how much it moves each one it reaches (0.25 to 3). Also read as: rice impact. | `2` |
| `confidence` | RICE: how sure the team is of the other three (0.5 to 1). Also read as: rice confidence. | `0.8` |
| `rice effort` | RICE: the effort it takes, in person-months. | `3` |
| `value score` | Value against effort: what it is worth. | `8` |
| `effort score` | Value against effort: what it costs to do. | `3` |

## transitions.csv — one row per status change

The history. Cycle time, the cumulative flow, delivery inside a sprint's window and spillover are measured from it. Without it, each item's started and resolved dates are the history where the items carry them; with neither, there are counts and current state.

| Column | | What it holds | Example |
|---|---|---|---|
| `key` | required | The item that changed. Also read as: issue key, work item key. | `NW-12` |
| `from` |  | The status it left; empty for its first. Also read as: from status, old status. | `To Do` |
| `to` | required | The status it entered. Also read as: to status, new status. | `In Progress` |
| `timestamp` | required | When — a date, or a date and a time. Also read as: at, date, changed, transition date, when. | `2026-08-12T09:00:00` |
| `author` |  | Who moved it. Also read as: by, changed by. |  |

## sprints.csv — one row per sprint an item was in

Sprint membership over time: what was committed at planning, pulled in, carried over or dropped. A row with a sprint and no key only dates the sprint. A team that does not sprint needs no sprints.csv.

| Column | | What it holds | Example |
|---|---|---|---|
| `sprint` | required | The sprint's name. Also read as: sprint name, iteration, iteration path. | `Sprint 34` |
| `key` |  | The item in it. Empty: the row only dates the sprint. Also read as: issue key, work item key. | `NW-12` |
| `start` |  | The sprint's first day. Also read as: start date, begin date. | `2026-08-10` |
| `end` |  | The sprint's last day. Also read as: end date, finish date. | `2026-08-23` |
| `completed` |  | When the sprint was closed, if it was. Also read as: complete date. | `2026-08-23` |
| `added_at` |  | When the item joined the sprint. Empty: it was there from the start, committed at planning. Also read as: added. |  |
| `removed_at` |  | When it left the sprint. Empty: it stayed. Also read as: removed. |  |

## History: how long the work took

- **`transitions.csv`** — Every status change. Cycle time, the cumulative flow, the time in each status and delivery inside a sprint's window are measured from it.
- **A `started` date, and no `transitions.csv`** — The history is when each item started and when it was resolved: cycle times and delivery dates, never the statuses in between. Azure DevOps' `Activated Date` is one, and so are Linear's `Started`, Shortcut's `started_at` and Rally's `In-Progress Date`. A start date somebody planned is not: it says when work was meant to start.
- **Neither** — Counts, and where each item stands now. Nothing that needs to know when something moved.

## Sprints

- **`sprints.csv`** — One row per sprint an item was in. `added_at` left empty means the item was committed at planning; a date means it was pulled in. `removed_at` says it left. Staying in a closed sprint and joining the next is a carry-over.
- **A row with a sprint and no key** — Dates the sprint and nothing more: how an export's sprints get their dates, and how a sprint nothing is in yet is named. Where one folder holds several projects, a `project` column says whose it is.
- **An export's sprint columns** — Jira's `Sprint` columns and Azure DevOps' `Iteration Path` say which sprints an item was in, not when it joined one: each reads as committed at the sprint's start.
- **A team that does not sprint** — Needs no `sprints.csv`.

## A tool's export, as it is

Each export is read as its tool documents it. So far only Jira's has been checked on a real export; a header that reads differently in yours, you answer when you upload it.

### Jira

1. Open Filters → View all issues and search for the project's work — `project = KEY`.
2. Choose Export → Export CSV (all fields).
3. Jira exports a thousand issues at a time: page through the results, export each page, and send the parts together.

**Read as it is** — `Issue key`, `Issue Type`, `Status`, `Created`, `Resolved`, `Custom field (Story point estimate)` or `Custom field (Story Points)`, `Custom field (Team)`, `Parent` (linked through `Issue id`) or `Custom field (Epic Link)`, every `Sprint` column, `Project key` and `Project name`.

**Not in it** — When work started, and when the sprints ran. Add a `started` column or a `transitions.csv`, and a `sprints.csv` with one row per sprint — its name, start and end.

### Azure DevOps

1. Open Boards → Queries and query the project's work items.
2. In Column options, show `ID`, `Work Item Type`, `Title`, `State`, `Assigned To`, `Area Path`, `Iteration Path`, `Story Points` (or `Effort`), `Created Date`, `Activated Date`, `Closed Date` and `Parent`.
3. Choose Export to CSV from the query's menu.

**Read as it is** — The area directly under the project is the team, the iteration path's last part is the sprint, and with no project column the area path's root is the project. `Activated Date` is when work started, so the cycle times need nothing more.

**Not in it** — When the sprints ran. Copy them from Project settings → Project configuration → Iterations into a `sprints.csv`: `Iteration Path`, `Start Date`, `Finish Date`.

### Linear

1. Open the team's issues, or a view of them.
2. Choose Export issues as CSV from the view's menu.

**Read as it is** — `ID` is the key, and its prefix the project; `Title`, `Status`, `Estimate`, `Team`, `Assignee`, `Parent issue`, `Created`, `Updated`, `Started` and `Completed` — so cycle times need nothing more. The cycle is the sprint, `Cycle Name` or else Cycle and its `Cycle Number`, dated by `Cycle Start` and `Cycle End`. A Linear `Project` is a body of work, not the project: it is not read.

**Not in it** — A type: every item is a Work item.

### GitHub Projects

1. Open the project's view with the fields you track shown, `URL` among them.
2. Choose Export view data from the view's menu.

**Read as it is** — `URL` names each item, as its repository and number (`app#12`); `Title`, `Status`, `Assignees`, `Iteration` as the sprint, `Estimate` and `Parent issue`. `Size` is a choice of sizes, not points: it is not read. A draft has no URL and is not read.

**Not in it** — A type, when work started and finished, and when the iterations ran: add `started` and `resolved` columns or a `transitions.csv`, and a `sprints.csv`.

### Trello

1. Open the board's menu → Print, export, and share → Export as CSV.

**Read as it is** — `Card ID` is the key, `Card Name` the summary, `List Name` the status, `Members` who works on it, `Last Activity Date` when it last changed and `Board Name` the project.

**Not in it** — A type, and any history — a card says where it stands, not when it moved: add `started` and `resolved` columns or a `transitions.csv`.

### ClickUp

1. Export the List or Table view as CSV with all columns, or the Workspace's task data.
2. Choose the ISO or POSIX date format: the normal one spells dates out in words.

**Read as it is** — `Task ID` is the key, `Task Name`, `Status`, `Assignees`, `Parent ID`, `Date Created`, `Date Updated`, `Date Done` or `Date Closed` as when it finished, and `Sprint Points`. `Start Date` and `Due Date` are a plan, not work: they are not read.

**Not in it** — When work started, and a type: add a `started` column or a `transitions.csv`.

### Asana

1. Open the project's menu → Export/Print → CSV.

**Read as it is** — `Task ID` is the key, `Name`, `Section/Column` as the status, `Assignee`, `Created At`, `Completed At` as when it finished, `Last Modified`, and `Parent task` — the parent's name, linked to the one task that has it. `Start Date` and `Due Date` are a plan: they are not read.

**Not in it** — When work started, and a type: add a `started` column or a `transitions.csv`.

### YouTrack

1. Search the project's issues and export the results as CSV.

**Read as it is** — `Issue Id` is the key, `Project`, `Summary`, `Type`, `State`, `Assignee`, `Sprints`, `Created`, `Updated` and `Resolved`. `Estimation` is a time, not points: it is not read.

**Not in it** — When work started, and when the sprints ran: add a `started` column or a `transitions.csv`, and a `sprints.csv`.

### Shortcut

1. Settings → Export Data → export the stories as CSV.

**Read as it is** — `id` is the key; `name`, `type`, `state`, `estimate`, `team`, `owners` (who works on it), `iteration` as the sprint, `epic` as the parent, and `created_at`, `started_at` and `completed_at` — so cycle times need nothing more. Shortcut's `project` is not the project here: it is not read.

**Not in it** — The epics, which are not rows of the export: a story names its epic, and it links to it where the epic is in the files too. And when the iterations ran: add a `sprints.csv`.

### Rally

1. Open the work items list with the columns you need shown.
2. Import/Export → Download CSV of this view.

**Read as it is** — `Formatted ID` is the key; `Name`, `Schedule State` as the status, `Plan Estimate`, `Iteration` as the sprint, `Owner`, `Project`, `Creation Date`, `Last Update Date`, `In-Progress Date` and `Accepted Date` as when it finished — so cycle times need nothing more.

**Not in it** — A type, and when the iterations ran: add a `sprints.csv` with each one's name, start and end.

## What a spreadsheet writes is read

- **Separators** — Comma, semicolon or tab — whatever your spreadsheet saves.
- **Workbooks** — An Excel workbook (`.xlsx`) is uploaded as it is: its first sheet is read, its first row the header, its dates as dates. An Excel 97–2003 `.xls` is not — save it as `.xlsx` or as CSV — and neither is a workbook protected by a password.
- **Text** — UTF-8, UTF-16 (Excel's “Unicode Text”), or the Windows encoding Excel's plain “CSV” writes.
- **Dates** — `2026-09-23` or `2026-09-23T14:05`, and also `23/09/2026` or `09/23/2026`, with or without a time. Whether the day or the month comes first is read from your files: one date like `23/09/2026` settles it, and if every day in them is 12 or less nothing does — write those year first. Month names are read too: `23/Sep/26 2:05 PM`, `23 sept. 2026`. So are the seconds or milliseconds since 1970 a tool writes — `1782896400000` — as UTC.
- **Numbers** — `2.5` or `2,5`.
- **A changelog export** — With a `Field` column, it is read as `transitions.csv`: only its status rows.

Anything the product cannot read is listed on Settings → Connection — file, row, column and what was done with it — and nothing is guessed.

## The two folders

- `empty/` — the three files with their header rows and nothing else. Fill these in.
- `example/` — Northwind Maritime's work, filled in: a train of five teams planning in increments, a Scrum
  team and a Kanban board, with their history. Open it first.
