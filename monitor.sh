#!/bin/bash

LOG_FILE="logs/system_monitor.log"
mkdir -p logs

echo "================================" >> $LOG_FILE
echo "System Report - $(date)" >> $LOG_FILE
echo "================================" >> $LOG_FILE

echo "[CPU Usage]" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" >> $LOG_FILE

echo "[Memory Usage]" >> $LOG_FILE
free -h >> $LOG_FILE

echo "[Disk Usage]" >> $LOG_FILE
df -h >> $LOG_FILE

echo "" >> $LOG_FILE
echo "Report saved to $LOG_FILE"
