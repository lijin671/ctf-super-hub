#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$HOME/.codex/skills}"
STAMP="$(date +%Y%m%d-%H%M%S)"

mkdir -p "$TARGET_DIR"

copy_dir() {
  local src="$1"
  local name
  name="$(basename "$src")"
  local dst="$TARGET_DIR/$name"

  if [[ -e "$dst" ]]; then
    local bak="$TARGET_DIR/${name}.bak-${STAMP}"
    echo "[backup] $dst -> $bak"
    mv "$dst" "$bak"
  fi

  echo "[copy] $src -> $dst"
  cp -R "$src" "$dst"
}

for path in "$SRC_DIR"/*; do
  name="$(basename "$path")"
  case "$name" in
    START-HERE.md|SKILL-INDEX.md|install-to-codex.sh|scripts)
      continue
      ;;
  esac
  [[ -d "$path" ]] || continue
  copy_dir "$path"
done

echo
echo "Done. Skills installed into: $TARGET_DIR"
echo "You can now inspect them there, or let Codex auto-discover them on next use."
