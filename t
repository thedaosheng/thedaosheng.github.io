#!/bin/sh
set -eu

URLS='https://cdn.jsdelivr.net/gh/thedaosheng/typeless-clipbridge@main/i
https://fastly.jsdelivr.net/gh/thedaosheng/typeless-clipbridge@main/i
https://gcore.jsdelivr.net/gh/thedaosheng/typeless-clipbridge@main/i
https://raw.githubusercontent.com/thedaosheng/typeless-clipbridge/main/i'

TMP_FILE="${TMPDIR:-/tmp}/typeless-clipbridge-short.$$"

cleanup() {
  rm -f "$TMP_FILE"
}
trap cleanup EXIT INT TERM

if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
  echo "typeless-clipbridge: curl or wget is required." >&2
  exit 1
fi

for url in $URLS; do
  if command -v curl >/dev/null 2>&1; then
    if curl -fsSL --connect-timeout 8 --retry 1 "$url" -o "$TMP_FILE" 2>/dev/null; then
      exec sh "$TMP_FILE" "$@"
    fi
  elif wget -q --timeout=8 -O "$TMP_FILE" "$url" 2>/dev/null; then
    exec sh "$TMP_FILE" "$@"
  fi
done

echo "typeless-clipbridge: failed to download installer from all mirrors." >&2
exit 1
