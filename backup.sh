#!/bin/bash
DOW=$(date +%A)
USERNAME="thebolarin"

#backup /boot
rsync -avz --delete --log-file=/backups/${DOW}/rsync_log/boot/ /backups/${DOW}/boot/

#empty trash
rm -rf /home/${USERNAME}/.local/share/Trash/files/*

#backup /root
rsync -avz --delete --exclude-from '/backups/others/root_exclude' --log-file=/backups/${DOW}/rsync_log/ /backups/${DOW}/root/

#backup home
rsync -avz --delete --exclude-from 'backups/others/home_exclude' --log-file=/backups/others/rsync_log/home/ /backups/others/home/
