#!/bin/bash

# ==========================================================
# Script Name: system_health.sh
# Description: Checks Disk, Memory, and CPU usage
# ==========================================================

#!/bin/bash

# Define the log file path
LOG_FILE="logs/health_report.log"

echo "--- SYSTEM HEALTH REPORT ---" | tee $LOG_FILE
date | tee -a $LOG_FILE
echo "" | tee -a $LOG_FILE

echo "Checking Disk Usage..." | tee -a $LOG_FILE
df -h | grep '^/dev/' | tee -a $LOG_FILE

echo "" | tee -a $LOG_FILE
echo "Checking Memory..." | tee -a $LOG_FILE
free -h | tee -a $LOG_FILE

echo "" | tee -a $LOG_FILE
echo "Checking CPU Load..." | tee -a $LOG_FILE
uptime | tee -a $LOG_FILE

echo ""
echo "Report saved to $LOG_FILE"
