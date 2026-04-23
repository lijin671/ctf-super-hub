#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-all}"

BASE_TOOLS=(file strings xxd python3 curl nc jq git grep sed awk)
PYTHON_STACK=(pwntools pycryptodome requests z3-solver)
REVERSE_TOOLS=(rizin radare2 ghidra)
FORENSICS_TOOLS=(binwalk exiftool foremost tshark)
WEB_TOOLS=(ffuf sqlmap)

check_cmd() {
  local cmd="$1"
  if command -v "$cmd" >/dev/null 2>&1; then
    printf '[ok] %s -> %s\n' "$cmd" "$(command -v "$cmd")"
  else
    printf '[missing] %s\n' "$cmd"
  fi
}

print_group() {
  local title="$1"
  shift
  echo
  echo "== $title =="
  for tool in "$@"; do
    check_cmd "$tool"
  done
}

print_manual_help() {
  cat <<'TXT'
Suggested manual installs (pick what fits your system):

Python packages:
  python3 -m pip install --user pwntools pycryptodome requests z3-solver

macOS (Homebrew examples):
  brew install binwalk exiftool ffuf jq sqlmap tshark
  brew install rizin radare2
  brew install --cask ghidra

Ubuntu / Debian examples:
  sudo apt update
  sudo apt install -y binwalk exiftool ffuf jq sqlmap tshark radare2

Notes:
- ghidra is great for reverse, but optional for lightweight triage
- pwntools + pycryptodome covers a lot of pwn/crypto scripting
- tshark/binwalk/exiftool are high-value beginner tools for forensics
TXT
}

case "$MODE" in
  all|check)
    print_group "Base tools" "${BASE_TOOLS[@]}"
    print_group "Reverse/RE tools" "${REVERSE_TOOLS[@]}"
    print_group "Forensics tools" "${FORENSICS_TOOLS[@]}"
    print_group "Web tools" "${WEB_TOOLS[@]}"
    echo
    echo "Python packages to consider: ${PYTHON_STACK[*]}"
    ;;
  python)
    echo "Recommended Python packages: ${PYTHON_STACK[*]}"
    echo "Install with: python3 -m pip install --user ${PYTHON_STACK[*]}"
    ;;
  manual|help)
    print_manual_help
    ;;
  *)
    echo "Usage: $0 [all|check|python|manual|help]"
    exit 1
    ;;
esac
