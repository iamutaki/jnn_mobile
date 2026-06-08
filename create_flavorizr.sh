#!/bin/bash
set -euo pipefail

# ============================================================
# create_flavorizr.sh
# Menjalankan flutter_flavorizr untuk generate platform configs
# (Android flavors, iOS schemes, Firebase config files).
# ============================================================

PROJECT_DIR="$(cd "$(dirname "${0}")" && pwd)"
cd "${PROJECT_DIR}"

echo "🚀 Running flutter_flavorizr..."

# Files yang akan di-overwrite oleh flavorizr.
# Kita backup dulu, lalu restore setelah selesai.
PROTECTED_FILES=(
  "lib/main.dart"
  "lib/app.dart"
)

# Backup
echo "Backing up protected files..."
for file in "${PROTECTED_FILES[@]}"; do
  if [[ -f "${file}" ]]; then
    backup="${file}.bck"
    cp "${file}" "${backup}"
    echo "   ✓ ${file} → ${backup}"
  fi
done

# Restore function — dipanggil saat selesai atau error
restore_files() {
  echo "Restoring protected files..."
  for file in "${PROTECTED_FILES[@]}"; do
    backup="${file}.bck"
    if [[ -f "${backup}" ]]; then
      mv "${backup}" "${file}"
      echo "   ✓ ${backup} → ${file}"
    fi
  done

  # Hapus file generated oleh flavorizr yang tidak diperlukan
  # (flavorizr generate main_staging.dart, main_production.dart, dll)
  rm -f lib/main_staging.dart
  rm -f lib/main_production.dart
  rm -rf lib/pages

  echo "Done!"
}

# Pastikan restore berjalan meskipun ada error
trap restore_files EXIT

# Jalankan flavorizr
flutter pub run flavorizr

echo "Flavorizr completed successfully."
