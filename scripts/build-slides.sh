#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo "Building tutorials..."
lake build tutorialsMain

echo "Generating slides..."
.lake/build/bin/tutorialsMain

echo ""
echo "Starting server at http://localhost:8000"
echo "Press Ctrl+C to stop"
python3 -m http.server -d _site 8000
