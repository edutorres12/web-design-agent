#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Web Design Agent — Updater ==="
echo ""

cd "$SCRIPT_DIR"

echo "[1/2] Pulling latest submodules..."
git submodule update --remote --merge

echo ""
echo "[2/2] Re-installing skills..."
./install.sh

echo ""
echo "=== All skills updated! ==="
