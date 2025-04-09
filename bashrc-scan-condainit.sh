#!/bin/bash
# This script scans all user home directories in /home/ for bashrc files containing uncommented conda init

# Output file to store usernames with active conda init
OUTPUT_FILE="users_with_active_conda_init.txt"

# Clear output file if it exists
> "$OUTPUT_FILE"

echo "Scanning home directories for active conda init..."

# Directly iterate through directories in /home/
for home_dir in /home/*; do
    # Skip if not a directory
    if [ ! -d "$home_dir" ]; then
        continue
    fi
    
    # Extract username from home directory path
    username=$(basename "$home_dir")
    
    BASHRC_PATH="$home_dir/.bashrc"
    
    if [ -f "$BASHRC_PATH" ]; then
        # Check if the file contains an uncommented __conda_setup= line
        # Using grep to find lines with __conda_setup= that don't start with # or whitespace followed by #
        if grep -q '^[^#]*__conda_setup=' "$BASHRC_PATH"; then
            echo "Found active conda init in user: $username"
            echo "$username" >> "$OUTPUT_FILE"
        fi
    fi
done

echo "Scan complete. Results saved to $OUTPUT_FILE"
echo "Total users with active conda init: $(wc -l < "$OUTPUT_FILE")"