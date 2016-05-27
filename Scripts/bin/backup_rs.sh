#! /bin/bash
rsync -P -r --exclude-from '/home/username/backup.txt'  /home/username ~/Загрузки/backup 