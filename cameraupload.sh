#!/usr/bin/env bash
cameradir='/Volumes/NO NAME/DCIM/'
cd "$cameradir" || exit
echo "========================= Moving photos to NAS pool ========================"
for dir in */
do
  echo "dir: " "$dir"
  date=$(stat -f "%Sm" -t "%y.%m.%d" "$dir")
  echo "date: " "$date"
  scp -r -p "$dir" homenas:/var/services/homes/nate/Photos/Raws/"$date"
done
#Trigger rsync script to move raws to NAS
#echo "========================= Sorting and moving Raws ========================"
#ssh homenas /var/services/homes/nate/moveraws.sh
#Trigger reindex of Photos dir(s) to have them appear in PhotoStation
echo "========================= Reindex Photos on NAS ========================"
ssh homenas 'find /var/services/homes/nate/Photos/Raws/ -mindepth 1 -maxdepth 1 -type d -mtime -1 -exec /usr/syno/bin/synoindex -R photo -A {} \;'