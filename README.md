# Сломать/починить Raid1
**[vagrant@otuslinux ~]$ sudo mdadm /dev/md0 --fail /dev/sdb**  

mdadm: set /dev/sdb faulty in /dev/md0

**[vagrant@otuslinux ~]$ cat /proc/mdstat**  

Personalities : [raid1]
md0 : active raid1 sdb[2](F) sdc[1]
      254976 blocks super 1.2 [2/1] [_U]
	  
**[vagrant@otuslinux ~]$ sudo mdadm -D /dev/md0**  

/dev/md0:
           Version : 1.2
     Creation Time : Fri Nov 15 14:00:26 2019
        Raid Level : raid1
        Array Size : 254976 (249.00 MiB 261.10 MB)
     Used Dev Size : 254976 (249.00 MiB 261.10 MB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

       Update Time : Tue Nov 19 15:52:34 2019
             State : clean, degraded
    Active Devices : 1
   Working Devices : 1
    Failed Devices : 1
     Spare Devices : 0

Consistency Policy : resync

              Name : otuslinux:0  (local to host otuslinux)
              UUID : e437ce06:bd9f0753:8b14c66c:d4132456
            Events : 44

    Number   Major   Minor   RaidDevice State
       -       0        0        0      removed
       1       8       32        1      active sync   /dev/sdc

       2       8       16        -      faulty   /dev/sdb


**[vagrant@otuslinux ~]$ sudo mdadm /dev/md0 --remove /dev/sdb**  

mdadm: hot removed /dev/sdb from /dev/md0


**[vagrant@otuslinux ~]$ sudo mdadm /dev/md0 --add /dev/sdb**  

mdadm: added /dev/sdb


**[vagrant@otuslinux ~]$ cat /proc/mdstat**  

Personalities : [raid1]
md0 : active raid1 sdb[2] sdc[1]
      254976 blocks super 1.2 [2/2] [UU]

unused devices: <none>

