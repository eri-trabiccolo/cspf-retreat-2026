#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mkdir -p dist
npx --yes @marp-team/marp-cli@latest slides.md -o dist/index.html
if [ -d images ]; then
  cp -r images dist/
fi
