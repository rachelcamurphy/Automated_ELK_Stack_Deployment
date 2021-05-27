#!/bin/bash
#The following scripts are useful for logging data for linux adminstrative purposes.
free -h >> ~/backups/freemem/free_mem.txt
du -h >> ~/backups/diskuse/disk_usage.txt
lsof >> ~/backups/openlist/open_list.txt
df -h >> ~/backups/freedisk/free_disk.txt
