#!/usr/bin/env bash
cameradir='/Volumes/NO NAME/DCIM/'
cd "$cameradir"
for dir in */
do
  echo "dir: " "$dir"
  date=$(stat -f "%Sm" -t "%y.%m.%d" "$dir")
  echo "date: " "$date"
  scp -r "$dir" homelan:/media/NAS/nathan/Photos/GoodCamera/"$date"
done
#Trigger rsync script to move raws to NAS
ssh homelan /home/nate/bin/moveraws
