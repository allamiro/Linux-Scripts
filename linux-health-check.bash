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

