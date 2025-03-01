#!/bin/bash

if ! command -v ollama &>/dev/null; then
  curl -fsSL https://ollama.com/install.sh | sh
fi

if ! command -v xclip &>/dev/null; then
  sudo apt update && sudo apt install xclip
fi

sudo cp gpt.sh /usr/local/bin/gpt
sudo chmod +x /usr/local/bin/gpt
