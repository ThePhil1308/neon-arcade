#!/usr/bin/env bash
# Übernimmt die aktuelle Arcade (~/spiele/index.html) nach GitHub Pages und lädt sie hoch.
# Aufruf: ~/spiele/github-pages/aktualisieren.sh ["Beschreibung der Änderung"]
set -euo pipefail
cd "$(dirname "$0")"
cp ../index.html index.html
if git diff --quiet -- index.html; then echo "Keine Änderung an index.html."; exit 0; fi
git add index.html
git commit -q -m "${1:-Neon Arcade aktualisiert ($(date +%d.%m.%Y))}"
git push -q
echo "Hochgeladen. In 1-2 Minuten unter https://thephil1308.github.io/neon-arcade/ zu sehen."
