#!/bin/bash

mdadm --zero-superblock --force /dev/sd{b,c}
mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb /dev/sdc

