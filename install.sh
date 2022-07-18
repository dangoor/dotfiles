#!/bin/sh

if ! which brew &>/dev/null; then
  echo "Homebrew is missing. Please install it first."
  #echo "Installing Homebrew..."
  #/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install chezmoi

chezmoi apply
