#!/bin/bash
# Builds the shareable zip: the skill folder plus a plain-text install guide.
# Usage: scripts/build-zip.sh [output folder]   (default: ../dist next to the repo)
set -euo pipefail

repo="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-$repo/../dist}"
version="$(sed -n 's/^Version \([0-9.]*\)\..*/\1/p' "$repo/plugins/finalize-session/skills/finalize-session/SKILL.md")"
name="finalize-session-$version"

stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
mkdir -p "$stage/$name" "$out"
cp -R "$repo/plugins/finalize-session/skills/finalize-session" "$stage/$name/"
cp "$repo/INSTALL.md" "$stage/$name/INSTALL - READ ME FIRST.txt"
find "$stage" -name '.DS_Store' -delete

rm -f "$out/$name.zip"
(cd "$stage" && COPYFILE_DISABLE=1 zip -rqX "$out/$name.zip" "$name")
echo "$out/$name.zip"
