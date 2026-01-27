#!/bin/bash

# ==========================================================
# Script Name: system_health.sh
# Description: Checks Disk, Memory, and CPU usage
# ==========================================================

echo "--- SYSTEM HEALTH REPORT ---"
date
echo ""

# 1. Check Disk Usage (Focus on the main partition)
echo "Checking Disk Usage..."
df -h | grep '^/dev/'

# 2. Check Free Memory
echo ""
echo "Checking Memory..."
free -h

# 3. Check CPU Load
echo ""
echo "Checking CPU Load..."
uptime

echo ""
echo "--- END OF REPORT ---"
