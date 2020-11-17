#!/bin/bash
# Description: Script use to check the health of the Linux systems
CHECK_FLAG=0
Report=/tmp/health-check-report_$date.txt
# If report file and approved user file exists
if [[ -f "$Report" && -f "$Approved" ]]; then

echo "Health Check Report exist"

echo "Approved User file"

fi

### Check for unapproved user accounts -- add your approved user accounts here
APPROVED_USERS="root user1 user2"
for APPROVED_USER in $APPROVED_USERS
do
        echo $APPROVED_USER >> /tmp/approved_users_$date
done

### Check for unapproved interactive accounts

### DISK MONITORING check

for DISK_UTILIZATION in $(df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5}')
do
        if (( $(echo $DISK_UTILIZATION | cut -d '%' -f1) > 90 ))
        then
                CHECK_FLAG=1
                echo "A file systems disk space utilization is at $DISK_UTILIZATION on $(hostname)" >> /tmp/health-check-report_$date.txt
        fi
done

### Send the report
if [ $CHECK_FLAG = 1 ]
then
 cat /tmp/healthCheckReport.txt | mail -s "SYSTEM Health Check: $(hostname)" -r "root@$(hostname)" mygroupemail@example.com
fi


