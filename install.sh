#!/bin/sh

set -e

# Detect OS
if [ "$(uname)" = "Darwin" ]; then
  # macOS
  if ! which brew &>/dev/null; then
    echo "Homebrew is missing. Please install it first."
    exit 1
  fi
  
  echo "Installing chezmoi via Homebrew..."
  brew install chezmoi
  
elif [ -f /etc/debian_version ] || which apt-get &>/dev/null; then
  # Debian/Ubuntu/Codespaces
  echo "Installing chezmoi via apt..."
  sudo apt-get update
  sudo apt-get install -y chezmoi
  
else
  echo "Unsupported OS. Please install chezmoi manually."
  exit 1
fi

echo "Applying chezmoi configuration..."
chezmoi apply
