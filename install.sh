#!/bin/sh

if ! which brew &>/dev/null; then
  echo "Installing Homebrew..."
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
fi

brew install chezmoi

chezmoi apply
