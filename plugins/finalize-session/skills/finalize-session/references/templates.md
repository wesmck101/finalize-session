# Templates for /finalize-session

Last updated: 2026-10-27

Use these when a standard file is missing. Fill in what the session knows. Leave a short `(to fill in)` where it doesn't, and list those gaps in the report. Keep the headings. Drop sections that don't apply.

## CLAUDE.md (project)
```markdown
# <Project name>

Last updated: YYYY-MM-DD

<One or two sentences: what this project is and who it's for.>

## Start here
1. Read this file, then `OPEN_ITEMS.md`, then the end of `LOG.md`.
2. Check `incoming/` for new files. Look at each one before using it.

## Rules
- <How the user wants work done here. One line each.>

## Where things are
| Path | What |
|---|---|
| `LOG.md` | Dated record of changes, newest at the bottom |
| `OPEN_ITEMS.md` | Unfinished work and anything waiting on someone |
| `incoming/` | Drop folder for new files; emptied by /finalize-session |
| `Archive/` | Retired notes, old logs, unused files, finalize backups |

## Session end
Type `/finalize-session` to bring these docs up to date. Without it, at least add a `LOG.md` entry and update `OPEN_ITEMS.md`.
```

If the project already has a `README.md` start file, use this short version instead:
```markdown
# <Project name>

Last updated: YYYY-MM-DD

Start with `README.md`. Then read `OPEN_ITEMS.md` (or <equivalent>) and the end of `LOG.md`.

## Rules
- <How the user wants work done here.>
```

## LOG.md
```markdown
# <Project name> log

Last updated: YYYY-MM-DD

Dated record of changes in this project. Newest at the bottom. Older years are in `Archive/logs/`.
```
If the project's log already lists the newest entry first, keep that order and say "Newest first" in this line instead.

### Log entry
```markdown
## YYYY-MM-DD — Short title
- What changed, and where (file paths, names, IDs).
- Why (the user's request, a notice, a fix).
- How to undo it.
- What's left, if anything (also in OPEN_ITEMS.md).
```

### Finalize run entry
```markdown
## YYYY-MM-DD — Finalize session: <short summary>
- Updated: <files, one line each or grouped>
- Created: <new standard files or folders, or "none">
- Retired: <count and where, or "none">
- Moved: <count, from incoming/ to where, or "none">
- Other projects: <project: change, or "none">
- Undo: restore from `Archive/finalize-runs/<stamp>/` (see its MANIFEST.md)
```

### Other-project line
```markdown
## YYYY-MM-DD — Updated by <other project> finalize
- <What changed and why.> Undo: `<main project>/Archive/finalize-runs/<stamp>/`.
```

## OPEN_ITEMS.md
```markdown
# <Project name> open items

Last updated: YYYY-MM-DD

Unfinished work, most important first. When an item is done, move it to `LOG.md` with the date.

1. **<Item>** *(who: user / Claude / someone else)*. <What's needed and where.>
```

## Archive/retired-notes.md
```markdown
# Retired notes

Last updated: YYYY-MM-DD

Text removed from this project's docs because it was out of date. Newest at the bottom. Each entry has the date, source file, reason and the original text.
```

### Retired entry
```markdown
## YYYY-MM-DD — from <file path>
Reason: <why it's out of date>
> <the original text, word for word>
```

## Archive/finalize-runs/<stamp>/MANIFEST.md
```markdown
# Finalize run <stamp>

Main project: <folder>
Approved plan: <one-line summary>

## Edited (backup in this folder)
- <relative path>

## Created (no backup; delete to undo)
- <relative path> — <what it is>

## Moved (move back to undo)
- <from> → <to>

## Retired
- <count> passages from <file> → <retired-notes path>

## Undo this run
1. Copy each backed-up file in this folder back to its original path.
2. Move each "Moved" file back to its "from" path.
3. Delete each "Created" item, if it's still unchanged.
```

## incoming/
No file needed. In a Git repo, add an empty `incoming/.gitkeep` so the folder stays in the repo.
