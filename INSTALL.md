HOW TO INSTALL /finalize-session
================================

Last updated: 2026-10-27  (skill version 1.0.1)

What this is
------------
A command for Claude Code. At the end of a work session you type
/finalize-session. Claude then brings your project's notes up to date so
the next session can pick up where you left off. It shows you a plan first
and changes nothing until you say yes.

Where it works
--------------
Claude Code only: the Claude desktop app's "Code" tab, the claude command
in Terminal, or Claude Code in VS Code / JetBrains.
It does NOT work in the regular claude.ai chat, because it needs to read
and move files on your computer.


EASIEST WAY: let Claude install it (about 1 minute)
---------------------------------------------------
1. Double-click the zip file. A folder appears next to it, named
   finalize-session-1.0.1 (usually in Downloads).
2. Open Claude Code (desktop app, "Code" tab).
3. Copy and paste this message to Claude, then press Enter:

   Please install the Claude Code skill in my Downloads folder at
   finalize-session-1.0.1/finalize-session as a personal skill. Copy that
   whole folder to ~/.claude/skills/finalize-session (on Windows,
   %USERPROFILE%\.claude\skills\finalize-session). Don't change any files
   in it. Then confirm that ~/.claude/skills/finalize-session/SKILL.md exists.

   (If the unzipped folder isn't in Downloads, change that part of the
   message to where it is.)
4. Approve the copy when Claude asks.
5. Start a NEW session. Skills load when a session starts.
6. Type /fin  and you should see /finalize-session in the list.

Done.


MANUAL WAY (if you prefer)
--------------------------
Mac: open Terminal and paste these two lines (assumes it's in Downloads):

   mkdir -p ~/.claude/skills
   cp -R ~/Downloads/finalize-session-1.0.1/finalize-session ~/.claude/skills/

Windows: open PowerShell and paste these two lines:

   New-Item -ItemType Directory -Force "$env:USERPROFILE\.claude\skills"
   Copy-Item -Recurse "$env:USERPROFILE\Downloads\finalize-session-1.0.1\finalize-session" "$env:USERPROFILE\.claude\skills\"

Then start a new Claude Code session and type /finalize-session.


HOW TO USE IT
-------------
- Open your session in the project's folder (or the folder above it, if
  you keep several projects together).
- When you're done working, type:  /finalize-session
  You can add a folder name after it to say which project:
  /finalize-session My Project
- Claude shows a plan. Read it. Reply "yes", or say what to change.
- Claude applies the plan, backs everything up, and ends with
  "Next session starts with: ..."

The first time, Claude may offer to create these in your project:
  CLAUDE.md      the "start here" file Claude reads at every session start
  LOG.md         a dated record of what changed and how to undo it
  OPEN_ITEMS.md  the to-do list for unfinished work
  incoming/      a folder where you drop files for Claude to sort
  Archive/       old notes, unused files and backups (nothing is deleted)
It explains each one and creates nothing until you say yes.


IF IT DOESN'T SHOW UP
---------------------
- Start a new session. Skills don't appear in a session that was
  already open.
- Check that this file exists:  ~/.claude/skills/finalize-session/SKILL.md
  A common mistake is one folder too many, like
  ~/.claude/skills/finalize-session/finalize-session/SKILL.md.
  Fix it by moving the inner folder up one level.
- Make sure you're in Claude Code, not the regular chat.


TO REMOVE IT
------------
Delete the folder ~/.claude/skills/finalize-session (or ask Claude to).
Your projects' notes and backups stay where they are.
