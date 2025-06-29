#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Approve PRs
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon ✅
# Documentation:
# @raycast.author louishuyng
# @raycast.authorURL https://raycast.com/louishuyng

# Each PR URL is separated by a end of line character
# We need to split the input string by the end of line character
# Also, remove any trailing white spaces
# Detect platform and get clipboard content
if command -v pbpaste &> /dev/null; then
  # macOS
  CLIPBOARD=$(pbpaste)
else
  echo "❌ Clipboard command not found. Please install pbpaste (macOS), xclip or wl-clipboard (Linux)."
  exit 1
fi

# Clean up and split into PR URLs
PR_URLS=$(echo "$CLIPBOARD" | tr " " "\n" | sed -e 's/[[:space:]]*$//' | grep '^https.*github\.com.*/pull/')

if [ -z "$PR_URLS" ]; then
  echo "⚠️ No valid PR URLs found in clipboard."
  exit 0
fi

# Loop through each PR URL
for PR_URL in $PR_URLS; do
  gh pr review "$PR_URL" --approve
  echo "✅ Approved PR: $PR_URL"
done
