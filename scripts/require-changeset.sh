#!/usr/bin/env bash
# Gerbang versioning: PR yang mengubah kontrak publik / komponen wajib
# menyertakan changeset (.changeset/*.md). Dijalankan di CI pada pull_request
# dan bisa dijalankan lokal: bash scripts/require-changeset.sh origin/main
set -euo pipefail

base="${1:-origin/main}"

# PR dari changesets bot (changeset-release/*) justru MENGONSUMSI changeset
# untuk menaikkan versi — gate tidak berlaku.
if [[ "${GITHUB_HEAD_REF:-}" == changeset-release/* ]]; then
  echo "PR rilis versi (${GITHUB_HEAD_REF}) — changeset tidak diperlukan."
  exit 0
fi

# PR dependabot mengganti lockfile/package.json secara mekanis dan ditinjau
# terpisah (CI + Security Scan) — changeset buatan manusia tidak diwajibkan.
if [[ "${GITHUB_ACTOR:-}" == "dependabot[bot]" ]]; then
  echo "PR dependabot — bump dependensi tidak memerlukan changeset."
  exit 0
fi

changed="$(git diff --name-only "${base}"...HEAD)"

if [ -z "$changed" ]; then
  echo "Tidak ada perubahan terhadap ${base} — changeset tidak diperlukan."
  exit 0
fi

# Path yang menyentuh kontrak publik / komponen (lihat docs/VERSIONING.md).
needs_changeset="$(printf '%s\n' "$changed" | grep -E '^(src/|package\.json$|module-federation\.config\.ts$|rslib\.config\.ts$)' || true)"

if [ -z "$needs_changeset" ]; then
  echo "Perubahan hanya menyentuh docs/tooling/CI — changeset tidak diwajibkan."
  exit 0
fi

if printf '%s\n' "$changed" | grep -qE '^\.changeset/.+\.md$'; then
  echo "Changeset ditemukan untuk perubahan kontrak publik:"
  printf '%s\n' "$needs_changeset" | sed 's/^/  - /'
  exit 0
fi

echo "::error::PR menyentuh kontrak publik/komponen tanpa changeset."
echo ""
echo "File yang memicu kewajiban changeset:"
printf '%s\n' "$needs_changeset" | sed 's/^/  - /'
echo ""
echo "Jalankan: bun run changeset"
echo "Lalu commit file .changeset/*.md. Lihat docs/VERSIONING.md."
exit 1
