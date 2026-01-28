#!/bin/bash

# Define the log file
LOG_FILE="logs/docker_status.log"

echo "--- DOCKER STATUS REPORT ---" | tee $LOG_FILE
date | tee -a $LOG_FILE
echo "" | tee -a $LOG_FILE

# Check how many containers are running
RUNNING=$(docker ps -q | wc -l)
TOTAL=$(docker ps -a -q | wc -l)

echo "Total Containers: $TOTAL" | tee -a $LOG_FILE
echo "Running Containers: $RUNNING" | tee -a $LOG_FILE

if [ "$TOTAL" -eq "0" ]; then
    echo "Warning: No containers found!" | tee -a $LOG_FILE
elif [ "$RUNNING" -lt "$TOTAL" ]; then
    echo "Alert: Some containers are stopped!" | tee -a $LOG_FILE
    echo "Stopped containers list:" | tee -a $LOG_FILE
    docker ps -f "status=exited" --format "table {{.Names}}\t{{.Status}}" | tee -a $LOG_FILE
else
    echo "All containers are running perfectly." | tee -a $LOG_FILE
fi
