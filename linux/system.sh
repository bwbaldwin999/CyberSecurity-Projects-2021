#!/bin/bash
current_date=$(date +%Y%m%d)
# INSTRUCTIONS: Edit the following placeholder command and output filepaths
# For example: cpu_usage_tool > ~/backups/cpuuse/cpu_usage.txt
# The cpu_usage_tool is the command and ~/backups/cpuuse/cpu_usage.txt is the filepath
# In the above example, the `cpu_usage_tool` command will output CPU usage information into a `cpu_usage.txt` file.
# Do not forget to use the -h option for free memory, disk usage, and free disk space

# Free memory output to a free_mem.txt file
free -h > ~/backups/freemem/free_mem.${current_date}.txt

# Disk usage output to a disk_usage.txt file
du -h > ~/backups/diskuse/disk_usage.${current_date}.txt

# List open files to a open_list.txt file
lsof > ~/backups/openlist/open_list.${current_date}.txt

# Free disk space to a free_disk.txt file
df -h > ~/backups/diskuse/free_disk.${current_date}.txt
