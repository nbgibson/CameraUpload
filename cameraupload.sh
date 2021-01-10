#!/usr/bin/env bash
cameradir='/Volumes/NO NAME/DCIM/'
cd "$cameradir"
echo "========================= Moving photos to homelan ========================"
for dir in */
do
  echo "dir: " "$dir"
  date=$(stat -f "%Sm" -t "%y.%m.%d" "$dir")
  echo "date: " "$date"
  scp -r "$dir" homelan:/media/NAS/nathan/Photos/GoodCamera/"$date"
done
#Trigger rsync script to move raws to NAS
echo "========================= Moving photos to NAS ========================"
ssh homelan /home/nate/bin/moveraws
#Trigger reindex of Photos dir(s) to have them appear in PhotoStation
echo "========================= Reindex Photos on NAS ========================"
ssh homenas find /var/services/photo/DSLR/ -mindepth 1 -maxdepth 1 -type d -mtime -1 -exec /usr/syno/bin/synoindex -R photo -A {} \;
