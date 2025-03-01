#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: coder <question>"
    exit 1
fi

input="$*"
system_msg="You only answer with the exact info the user has asked for without any additional information. so that the user can copy your entire answer and apply it. for example if he wants a cli command your entire answer should be only the command. if he wants a piece of code your entire answer should only consist of the code. For context the users system is a debian machine with amd64 architecture.
Do not use any quotes around code."

output=$(ollama run llama3.2 "System: $system_msg. User: $input")


echo "$output"

if command -v xclip &>/dev/null; then
    echo "$output" | xclip -selection clipboard  # Uses xclip
elif command -v xsel &>/dev/null; then
    echo "$output" | xsel --clipboard --input  # Uses xsel
else
    echo "Clipboard copy not supported. Install xclip or xsel."
fi
