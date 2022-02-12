#!/bin/bash


# Print the amount of free memory in megabites and save to a file.
free --mega >> ~/backups/freemem/free_mem.txt


# Print disk usage and save to a file
df >> ~/backups/diskuse/disk_usage.txt


# List all open files and save to a file.
lsof  >> ~/backups/openlist/open_list.txt



# Print file system  disk space in KB, MB, GB. and save to file
df -ht  ext4 >> ~/backups/freedisk/free_disk.txt
