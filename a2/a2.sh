#!/bin/bash

check_size(){
	# du(disk usage) command, -s(summarize only specified directory, -m(display in megabytes), -f1(extract first field column from each line of text)
	directory_size=$(du -sm "$1" | cut -f1)
	echo "The current size of the directory '$1' is: ${directory_size}MB"
}

prompt_for_directory() {
	echo "Please enter the path to the directory you want to check (Ex: /home/username/):"
	read -r directory_path

	if [ -d "$directory_path" ]; then
		check_size "$directory_path"
	else
		echo "Please try again."
	fi
}

# When shell script is run (main)
while true; do
	echo "Do you want to check a directory size? (y/n)"
	# -r so backslashes are interpretted correctly
	read -r user_input

	if [ "$user_input" == "y" ]; then
		prompt_for_directory
	elif [ "$user_input" == "n" ]; then
		echo "Goodbye!"
		break
	else
		echo "Invalid input, please type 'y' for Yes or 'n' for No."
	fi
done
