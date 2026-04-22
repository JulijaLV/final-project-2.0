#!/bin/bash

set -e

echo "Running tests..."

[ -f index.html ] || { echo "ERROR: index.html missing"; exit 1; }
[ -f server.js ] || { echo "ERROR: server.js missing"; exit 1; }
[ -f package.json ] || { echo "ERROR: package.json missing"; exit 1; }

grep -q "My Final Project 2.0" index.html || { echo "ERROR: Missing title"; exit 1; }
grep -q "Author:" index.html || { echo "ERROR: Missing author"; exit 1; }
grep -q "/api/container-info" index.html || { echo "ERROR: Missing API call in HTML"; exit 1; }

grep -q "express" package.json || { echo "ERROR: Express dependency missing"; exit 1; }
grep -q "hostname" server.js || { echo "ERROR: hostname info missing in API"; exit 1; }
grep -q "container-info" server.js || { echo "ERROR: API endpoint missing"; exit 1; }

echo "All tests passed ✅"
exit 0