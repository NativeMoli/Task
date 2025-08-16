#!/bin/bash

dir=~/linux_p2
backup_dir=$dir/backup
mkdir -p "$backup_dir"

current_date=$(date +%F)

for file in "$dir"/*.txt; do
    echo "Архівування файлу: $(basename "$file")"
    tar -czf "$backup_dir/$(basename "$file")_$current_date.tar.gz" -C "$dir" "$(basename "$file")"
done

	old_backup_dir=~/linux_p2/old_backup
	mkdir -p "$old_backup_dir"

	find "$backup_dir" -type f -mmin +3 -exec mv {} "$old_backup_dir/" \;
