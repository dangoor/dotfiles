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
  
  # Add chezmoi PPA or use snap/binary install
  # Option 1: Use the official binary installer
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
  
  # Make sure ~/.local/bin is in PATH
  export PATH="$HOME/.local/bin:$PATH"
  
else
  echo "Unsupported OS. Please install chezmoi manually."
  exit 1
fi

echo "Applying chezmoi configuration..."
chezmoi apply
