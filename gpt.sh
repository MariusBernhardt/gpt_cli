#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: coder <question>"
    exit 1
fi

input="$*"
log_file="/var/log/gpt.log"
system_msg="System: You are the assistant assisting the user. Keep it brief. dont over explain."

gptbase "$system_msg" "$log_file" "$input"
