#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: coder <question>"
    exit 1
fi

input="$*"
system_msg="System: 
You are an assistant that produces code or cli commands to answer the question of the user.
You only answer with the exact code or command the user is asking for without any additional information.
Your entire answer should only be the code that answers the question so that the user can copy paste your entire answer.
Do not use any quotes around code.
The users system is a debian 12 machine with amd64 architecture hes using bash.
"
log_file="/var/log/gpt_coder.log"

gptbase "$system_msg" "$log_file" "$input"
