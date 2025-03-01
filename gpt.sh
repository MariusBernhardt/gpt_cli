#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: gpt <question>"
    exit 1
fi

input="$*"
system_msg="Keep it brief. dont over explain."
output=$(ollama run llama3.2 "$system_msg. $input")
echo "$output"

if command -v xclip &>/dev/null; then
    echo "$output" | xclip -selection clipboard  # Uses xclip
elif command -v xsel &>/dev/null; then
    echo "$output" | xsel --clipboard --input  # Uses xsel
else
    echo "Clipboard copy not supported. Install xclip or xsel."
fi
