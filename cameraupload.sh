#!/usr/bin/env bash
cameradir="/Volumes/NO\ NAME/DCIM/"
for D in `find "$cameradir" -type d`
do
  if [[ "$D" == "$cameradir" ]]; then
    continue
  else
    echo "D: " "$D"
    date=$(stat -f "%Sm" -t "%y.%m.%d" "$D")
    echo "date: " "$date"
    scp -r "$D" homelan:/media/NAS/nathan/Photos/GoodCamera/"$date"
  fi
done

ssh homelan /home/nate/bin/moveraws
