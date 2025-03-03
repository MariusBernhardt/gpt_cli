#!/bin/bash

if ! command -v ollama &>/dev/null; then
  echo "installing ollama"
  curl -fsSL https://ollama.com/install.sh | sh
fi

if ! command -v xclip &>/dev/null; then
  echo "installing xclip"
  sudo apt update && sudo apt install xclip
fi

sudo cp gpt_base.sh /usr/local/bin/gptbase
sudo chmod +x /usr/local/bin/gptbase

sudo cp gpt.sh /usr/local/bin/gpt
sudo chmod +x /usr/local/bin/gpt
echo "gpt installed: to use run: gpt <your question>"


sudo cp coder.sh /usr/local/bin/coder
sudo chmod +x /usr/local/bin/coder
echo "coder installed: to use run: coder <your question>"
