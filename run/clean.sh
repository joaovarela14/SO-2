#!/bin/bash

rm -f error*
rm -f core

# change 0x61066137 to your semaphore and shared memory key
current_user=$(whoami)

if [ "$current_user" == "varela" ]; then
    ipcrm -S 0x61061882 || { echo "Failed to remove semaphore for varela"; exit 1; }
    ipcrm -M 0x61061882  || { echo "Failed to remove shared memory for varela"; exit 1; }
else
    ipcrm -S 0x6105141d || { echo "Failed to remove semaphore for other users"; exit 1; }
    ipcrm -M 0x6105141d || { echo "Failed to remove shared memory for other users"; exit 1; }
fi


