#!/bin/bash
# Description: Script use to check the health of the Linux systems
CHECK_FLAG=0
Report=/tmp/health-check-report.txt
# If report file and approved user file exists
if [[ -f "$Report" && -f "$Approved" ]]; then

echo "Health Check Report exist"

echo "Approved User file"

fi

