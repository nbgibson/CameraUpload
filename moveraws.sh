#!/usr/bin/env bash
echo "##########Move to Raws folder##########"
rsync -ahzi --ignore-existing --progress --exclude '*.JPG' --exclude '*.MP4' --prune-empty-dirs /volume1/NAS/nathan/Photos/GoodCamera/ /volume1/NAS/nathan/Photos/Raws
echo "##########Purge defunct Raws##########"
find /volume1/NAS/nathan/Photos/GoodCamera -name "*.ARW" -type f -delete
echo "##########Port Raws to Photostation##########"
rsync -ahzi --ignore-existing --progress --prune-empty-dirs /volume1/NAS/nathan/Photos/Raws/ /volume1/photo/DSLR/
