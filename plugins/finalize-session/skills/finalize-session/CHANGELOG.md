# Changelog

Last updated: 2026-10-27

Changes to the files in this skill folder. Newest at the bottom. This file covers the skill itself only. Each run's logs, backups and retired notes are written in the user's own project folders, never here.

## 1.0.0 — 2026-10-27
- First shareable release. Works in any project folder, with or without a parent workspace.
- Creates any missing standard files (`CLAUDE.md`, `LOG.md`, `OPEN_ITEMS.md`, `incoming/`, `Archive/`) after approval, and explains what each is for.
- Uses existing equivalents (for example `NEXT-STEPS.md` or `README.md`) instead of duplicating them.
- Each run's backups go in the project's `Archive/finalize-runs/<stamp>/`, with a `MANIFEST.md` listing every edit, move and new file, and how to undo the run.
- Size budgets for start files and logs. Long logs are rolled into `Archive/logs/` by year, only after approval.
- Out-of-date text is retired to `Archive/retired-notes.md`, never deleted.
- Plans for sessions that touched several projects, one section per project.
- Checks a workspace folder map against the folders on disk.
- Skips likely secret files by name. Never commits or pushes in Git repos.
- "Nothing to finalize" stops early. Loose ends outside the docs are reported, not changed.

## 1.0.1 — 2026-10-27
Fixes from the first trial run.
- Open items or a log kept as sections inside `CLAUDE.md` are moved into `OPEN_ITEMS.md` and `LOG.md`, with a pointer left behind. Log entries that are already in `LOG.md` are retired as duplicates, not copied twice.
- Follows the project's existing log order (newest first or last).
- Workspace changes are recorded in the main project's run entry and manifest when the workspace has no `LOG.md`. Retired workspace text goes to the main project's retired notes in that case.
- Incoming files are checked for exact duplicates of files already in the project.
- The path check reads paths relative to the folder named in the same table row or sentence, so it stops reporting paths that aren't actually missing.
- Archive, log and backup locations named in the workspace or project docs override the defaults.
