---
name: finalize-session
description: End-of-session documentarian for any project folder. Brings the project's docs up to date so the next session can start from them alone, creates any missing standard files (CLAUDE.md, LOG.md, OPEN_ITEMS.md, incoming/, Archive/), retires out-of-date notes, files away incoming/, and keeps a dated log with backups. Plans first, applies only after one approval. Run only when the user types /finalize-session.
argument-hint: "[project folder]"
disable-model-invocation: true
---

# Finalize session

Version 1.0.1. Last updated 2026-10-27. Changes: `CHANGELOG.md` in this folder.

**Goal:** when this finishes, a brand-new session can start from the project's docs alone. Everything the user taught or decided this session is written down. Nothing out of date is left to mislead. `incoming/` is empty. Every change is logged and can be undone.

**Two levels.** A **project** is one folder of work. A **workspace** is an optional parent folder holding several projects, with its own `CLAUDE.md` of shared rules. This skill works at both, and follows the rules in both `CLAUDE.md` files. When they are stricter than this skill, they win.

**Their locations win too.** If the workspace or project docs name a different place for archives, retired notes, logs or backups (for example one shared `Archive/` for a group of projects), use that place instead of the defaults below.

## Safety rules (always)
- **Plan first, then one yes.** Phase 1 changes nothing. Phase 2 starts only after the user approves the plan. They can edit, drop or add items first. A yes approves only what was listed.
- **Retire, never delete.** Out-of-date text leaves the active docs and goes to the project's `Archive/retired-notes.md` with the date and reason. Files are moved, never removed. Every file is backed up before it is edited.
- **Logs only grow.** Never remove or rewrite a past log entry. A long log may be rolled into `Archive/logs/` (see "Size budgets"), and only as a plan item.
- **Re-read before writing.** Other sessions may edit these files. Read each file right before editing it, make targeted edits (never rewrite a whole file from memory), and keep anything someone else added.
- **Docs and moves only.** This skill edits Markdown docs, creates the standard files and folders, moves files out of `incoming/`, and may add one `.gitignore` line (see "Git"). It never changes code, settings, generated files, websites, accounts or any online service.
- **No secrets.** Never open, print, copy or move a likely secret file (see "Secret files"). If a doc contains a password or key, don't repeat it: flag the file and line number in the report.
- **Never write into this skill's own folder.** Every log, backup, manifest and retired note goes in the user's project or workspace folder.
- **If unsure which project something belongs to, ask.** Don't guess.

## Standard files (project root)
| Item | What it is | Why |
|---|---|---|
| `CLAUDE.md` | Start-here file: purpose, rules, where things are, how to start a session | Claude loads it automatically, so a new session finds it without being told |
| `LOG.md` | Dated record of what changed, why, and how to undo it. Newest at the bottom | Lets anyone see what happened and reverse it |
| `OPEN_ITEMS.md` | Numbered list of unfinished work and anything waiting on someone | The next session knows exactly where to start |
| `incoming/` | Drop folder for new files, screenshots and notes | One place to look for new material; emptied every finalize |
| `Archive/` | Retired notes, old log years, unused files, and run backups (`Archive/finalize-runs/`) | Keeps old material out of the way without losing it |

Templates are in `references/templates.md`. A project root is the folder holding a `CLAUDE.md` or `README.md`, or the folder the user names after the command. Subfolders inside a project don't get their own set.

**Use what the project already has.** If it already has a file that does the same job, use that file and don't create a duplicate. Note the mapping in `CLAUDE.md`. Examples: `NEXT-STEPS.md` or `TODO.md` instead of `OPEN_ITEMS.md`, `CHANGELOG.md` or `HISTORY.md` instead of `LOG.md`. If only a `README.md` exists, create a short `CLAUDE.md` that points to it instead of copying it.

**Sections inside `CLAUDE.md`.** If open items or a log live as sections inside `CLAUDE.md`, plan to move them into `OPEN_ITEMS.md` and `LOG.md` and leave a one-line pointer. This keeps the start file short. Move log entries word for word. Entries that already appear in `LOG.md` are retired as duplicates, not copied twice.

**Log order.** Follow the order the project's log already uses (newest at the top or at the bottom), and say which in its header line. A new log puts the newest entry at the bottom.

**Creating missing items.** List each missing item in the plan (section G) with one plain sentence on what it is and why it's needed, taken from the table above. Create nothing until the user approves. In the report, repeat what was created so the user knows what the new files are for.

## Size budgets (keep it lean)
New sessions read these files every time, so being complete must not mean being long.
- `CLAUDE.md`: about 150 lines or less. It holds rules and pointers. Put longer detail in topic docs it links to.
- `OPEN_ITEMS.md`: open items only. Finished items move to `LOG.md`.
- `LOG.md`: past about 500 lines, propose moving earlier years' entries to `Archive/logs/LOG-<YYYY>.md`. Always keep the current year and at least the last 20 entries. Leave a line at the top pointing to the archive.
- One fact lives in one place. Other docs link to it instead of repeating it.
- Every standard file has a `Last updated: YYYY-MM-DD` line under its title. Update it whenever the file is edited.
- Always use absolute dates, never "yesterday" or "next week".

## Secret files
Judge by file name only, without opening the file. Skip anything matching `*password*`, `*passwd*`, `*secret*`, `*credential*`, `*token*`, `.env` or `.env.*` (except `.env.example`), `*.pem`, `*.key`, `*.p12`, `id_rsa*`, `.dev.vars`, `.netrc`, `.npmrc`, and folders like `.wrangler/`, `.aws/`, `.ssh/`. If one is in `incoming/`, leave it there and tell the user to move it into a password manager.

## Git
If a project, or a file being edited, is inside a Git repository:
- Never commit, push, switch branches or stash. The report lists files that now have uncommitted changes.
- If `Archive/finalize-runs/` isn't git-ignored, add to the plan: "add `Archive/finalize-runs/` to `.gitignore`". Backups shouldn't end up in the repo history.
- An empty `incoming/` isn't tracked by Git. Add `incoming/.gitkeep` if the project wants it kept in the repo.

## Phase 1: Review (read-only)
1. **Scope.** List the projects this session worked in or changed, from the conversation and the files touched. If the user named a folder after the command, that's the main project. If it's unclear which project a change belongs to, ask. If nothing changed and nothing was learned, say so and stop.
2. **Workspace.** Look in the parent folders for a workspace `CLAUDE.md`. Stop at the user's home folder. If there is one, read it and any global files it lists, and follow their rules. If it has a folder map, compare it with the folders actually on disk and plan fixes for anything missing, moved or extra.
3. **Standard files.** For each project in scope, check the standard set. Plan to create what's missing, or note the existing file that does the same job.
4. **What's not written down yet.** Read the project's `CLAUDE.md` (or its README or start file), `OPEN_ITEMS.md`, the end of `LOG.md`, and any docs the session touched. Note:
   - what the session changed, decided or learned that isn't in the docs
   - open items now done (they move to the log) and new ones
   - anything the user taught or corrected (how they want something done). That becomes a rule in `CLAUDE.md`
   - facts, IDs, statuses, paths or "pending" notes that are now wrong
5. **Other projects affected.** Search the other projects' docs in the workspace (`grep`) for anything this session changed: file paths, names, URLs, IDs, prices, policies, contact details. For each hit that's now wrong or incomplete, plan the fix and a one-line entry in *that* project's `LOG.md` saying what changed and which project caused it.
6. **Workspace rules.** Decide whether anything from this session applies beyond one project. If there's a workspace, draft the exact wording and which workspace file it goes in. If there's no workspace, put it in this project's `CLAUDE.md` and mention it in the report.
7. **Out-of-date content.** In each project's docs, find text that's been replaced by a later decision, describes something removed, repeats another doc, or is a resolved "pending" note. Plan to retire it. Finished open items move to `LOG.md`, not to retired notes. Log entries are never retired. Check the size budgets too.
8. **Incoming.** List every file in each project's `incoming/`, and any loose files the user dropped in the workspace root. Skip secret files by name. Look at each one (open images, skim documents). For each, choose:
   - its home in the project, or a new subfolder there (see "New folders")
   - `Archive/` (`unused-media/`, `reference/` or `incoming-<YYYY-MM-DD>/`) if it's no longer needed
   - **unclear:** a suggested home, plus a question for the user

   Check each file for an exact copy already in the project: compare sizes first, then contents (`cmp` or a checksum). An exact duplicate goes to `Archive/unused-media/`, and the plan names the file it duplicates.

   Notices, letters and screenshots that document an open issue are evidence. They stay with that issue's docs, not in `Archive/`.
9. **Memory.** If Claude has a persistent memory for this folder (for example Claude Code's auto-memory), check its notes about these projects. Plan updates so they match the docs. If there's no such memory, skip this step.
10. **Loose ends.** Note things outside these docs that the user should know about, but don't change them: settings that point to temporary or deleted paths, stale preview configs, uncommitted Git changes, likely secret files.

## New folders
A new subfolder inside a project is fine when a file has no good home:
- Only inside a project in scope. Never a new top-level folder or a new project unless the user asks.
- Use an existing folder first. Create one only when the files don't fit anywhere, or when three or more related files would otherwise be scattered.
- Match the project's naming style and use a clear name. No `misc/`, `other/` or `new-folder/`.
- List it in the plan with its purpose, and add it to the folder map in `CLAUDE.md`.

## The plan (show the user, then stop)
Send one compact message. Repeat sections A, D, E and G for each project when there's more than one. Leave out empty sections, or write "none".
- **A. This project:** each doc and what's added or changed (one line each), the new `LOG.md` entry, and the `OPEN_ITEMS.md` changes.
- **B. Other projects:** file, change, and the log line it gets.
- **C. Workspace rules:** the exact new or changed wording, and which file.
- **D. Retire:** short quote, source file, reason. Also any log rollover.
- **E. Incoming:** `file → destination` for each file, new folders marked **new** with their purpose, and questions about unclear files.
- **F. Memory:** notes to update.
- **G. New standard files:** each item, what it is and why it's needed. Also any `.gitignore` line.
- **H. Loose ends:** things you found but won't change.
- **Backup folder** for this run.

Then ask: "Approve this plan?" Wait for a yes, and for answers about any unclear files.

## Phase 2: Apply
Run stamp: `YYYY-MM-DD-HHMMSS`, local time. Run folder: `<main project>/Archive/finalize-runs/<stamp>/`.
1. **Back up** every existing file you'll edit into the run folder, keeping paths relative to the main project. Files in other projects go under `_projects/<project folder name>/…`. Workspace files go under `_workspace/…`. Memory notes go under `_memory/…`.
2. **Start `MANIFEST.md`** in the run folder (template in `references/templates.md`). Record each action as you do it: edited, created, moved (from → to), retired, plus how to undo the run.
3. **Create** the approved standard files and folders.
4. **Retire:** add each passage to the right project's `Archive/retired-notes.md` (format in `references/templates.md`), then remove it from the source file.
5. **Edit** the docs as planned: this project, other projects, workspace files. Re-read each file just before editing it. Update its `Last updated` line.
6. **Log:**
   - the main project's `LOG.md` gets one entry for this run (format in `references/templates.md`)
   - each other project gets its one-line entry
   - the workspace `LOG.md`, if there is one, gets an entry when workspace files changed, files moved between projects, or a project was added, moved or archived. With no workspace `LOG.md`, record workspace changes in the main project's run entry and `MANIFEST.md` instead. Don't create a workspace log unless the plan included it.
   - every entry names the run folder as its undo step

   Retired workspace text goes to the workspace's `Archive/retired-notes.md` if it has one. Otherwise it goes to the main project's retired notes, with "from workspace `CLAUDE.md`" (or the file's name) in the heading.
7. **Move incoming files** with `mv -n` (never overwrite). On a name clash, add `-<YYYY-MM-DD>` before the extension. Fix any doc that pointed to the old path. Never delete a file.
8. **Memory:** update the planned notes and their index lines.

## Phase 3: Check and report
Check:
- `incoming/` is empty, except files the user chose to keep there and secret files.
- Every planned edit is in place.
- Every file path in the edited docs (links and paths in backticks) still points to something real. Read each path relative to the doc's folder, or to the folder named in the same table row or sentence. Report only paths that can't be found either way. Skip commands, URLs and paths outside the project.
- The run folder holds a backup of every edited file, and `MANIFEST.md` lists every action.
- The standard files exist, each with a current `Last updated` line.

Report in a few short lines:
- files updated, by project
- new standard files created, and what each is for
- workspace rule changes
- notes retired and files moved
- loose ends for the user, including uncommitted Git changes
- the run folder
- **"Next session starts with: …"** (the first item in `OPEN_ITEMS.md` or its equivalent)
