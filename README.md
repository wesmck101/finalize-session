# finalize-session

Last updated: 2026-10-27

A Claude Code skill that wraps up a work session. Type `/finalize-session` and Claude brings the project's docs up to date so the next session can start from them alone. It shows a plan first and changes nothing until you approve it.

What it keeps current, in every project:
- `CLAUDE.md`: start-here file (rules, where things are)
- `LOG.md`: dated record of changes, with undo steps
- `OPEN_ITEMS.md`: unfinished work
- `incoming/`: drop folder, emptied each run
- `Archive/`: retired notes, old logs, unused files, run backups

Missing files are created after approval, with a note on what each is for. Out-of-date text is retired to `Archive/retired-notes.md`, never deleted. Each run backs up what it edits and writes a `MANIFEST.md` so the whole run can be undone.

Works in Claude Code only (desktop app Code tab, terminal, IDE). Not in claude.ai chat.

## Install
- **From a zip:** see `INSTALL.md`.
- **As a plugin**, once this repo is on GitHub:
  ```
  /plugin marketplace add wesmck101/finalize-session
  /plugin install finalize-session@finalize-session
  ```
  Installed as a plugin, the command shows as `/finalize-session:finalize-session`.

## Layout
| Path | What |
|---|---|
| `plugins/finalize-session/skills/finalize-session/` | The skill: `SKILL.md`, `references/templates.md`, `CHANGELOG.md` |
| `plugins/finalize-session/.claude-plugin/plugin.json` | Plugin manifest |
| `.claude-plugin/marketplace.json` | Marketplace manifest, for one-command install from GitHub |
| `INSTALL.md` | Plain install guide, included in the zip |
| `scripts/build-zip.sh` | Builds the shareable zip |

## Changes
See `plugins/finalize-session/skills/finalize-session/CHANGELOG.md`. Update the version in `SKILL.md`, both manifests, `INSTALL.md` and the changelog together.

Author: Wes McKithern. License: MIT (see `LICENSE`).
