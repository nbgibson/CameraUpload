#!/usr/bin/env bash
#echo "##########Move to Raws folder##########"
#rsync -ahzi --ignore-existing --progress --exclude '*.JPG' --exclude '*.MP4' --prune-empty-dirs /var/services/homes/nate/Photos/GoodCamera/ /var/services/homes/nate/Photos/Raws
#echo "##########Purge defunct Raws##########"
#find /var/services/homes/nate/Photos/GoodCamera -name "*.ARW" -type f -delete
#echo "##########Port Raws to Photostation##########"
#rsync -ahzi --ignore-existing --progress --prune-empty-dirs /var/services/homes/nate/Photos/Raws/ /volume1/photo/DSLR/
