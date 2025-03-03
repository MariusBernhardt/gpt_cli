#!/bin/bash

system_msg="$1"
log_file="$2"
shift 2
input="$@"
user_msg="User: $*"

if [ "$input" == "forget" ]; then
	sudo rm -rf $log_file
	echo "GPT session reset"
	exit 0
fi
if [ "$input" == "log" ]; then
	cat $log_file
	exit 0
fi

if [ ! -f $log_file ]; then
	sudo touch $log_file
	sudo chmod 777 $log_file
	sudo echo $system_msg >> $log_file
fi
historyLog=$(cat /var/log/gpt.log)
output=$(ollama run llama3.2 "$historyLog $user_msg")
sudo echo "$user_msg" >> $log_file
sudo echo "Assistant: $output" >> $log_file
echo -E "$output"

code_example=$(echo "$input" | awk '/\`\`\`/ {found=1; next} found && /\`\`\`/ {exit} found {print}')

if command -v xclip &>/dev/null; then
    echo "$code_example" | xclip -selection clipboard
else
    echo "Warning: Clipboard copy not supported. Install xclip."
fi
