#!/bin/bash

# A script to deploy AI configuration files to a target project directory.

# --- Configuration ---
# The target project path is expected as the first argument ($1).
TARGET_DIR=$1

# --- Validation ---
# Check if the target directory argument was provided.
if [ -z "$TARGET_DIR" ]; then
  echo "Error: Target project path is not provided."
  echo "Usage: $0 /path/to/your/project"
  exit 1
fi

# Check if the target directory exists.
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Target directory '$TARGET_DIR' does not exist."
  exit 1
fi

# --- Main Logic ---
# Get the absolute path of the directory where this script is located.
# Then, go up one level to get the root of the 'ai-configs' repo.
SOURCE_DIR=$(cd "$(dirname "$0")/.." && pwd)

echo "Deploying AI configurations to: $TARGET_DIR"
echo "Source repository: $SOURCE_DIR"
echo ""

# --- Deploy GitHub Copilot Config ---
# Define source and destination paths.
COPILOT_SOURCE="$SOURCE_DIR/copilot/instructions.md"
COPILOT_DEST_DIR="$TARGET_DIR/.github"
COPILOT_DEST_FILE="$COPILOT_DEST_DIR/copilot-instructions.md"

if [ -f "$COPILOT_SOURCE" ]; then
  # Ensure the .github directory exists.
  mkdir -p "$COPILOT_DEST_DIR"
  # Copy the instructions file.
  cp "$COPILOT_SOURCE" "$COPILOT_DEST_FILE"
  echo "✅ Copilot instructions deployed to $COPILOT_DEST_FILE"
else
  echo "⚠️ Warning: Copilot source file not found at $COPILOT_SOURCE"
fi

# --- Deploy Gemini CLI Config ---
# Define source and destination paths.
GEMINI_SOURCE="$SOURCE_DIR/gemini/GEMINI.md"
GEMINI_DEST_FILE="$TARGET_DIR/GEMINI.md"

if [ -f "$GEMINI_SOURCE" ]; then
  # Copy the Gemini context file to the project root.
  cp "$GEMINI_SOURCE" "$GEMINI_DEST_FILE"
  echo "✅ Gemini context deployed to $GEMINI_DEST_FILE"
else
  echo "⚠️ Warning: Gemini source file not found at $GEMINI_SOURCE"
fi


echo -e "\nDeployment complete!"