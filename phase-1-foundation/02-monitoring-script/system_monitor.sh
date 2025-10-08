#!/bin/bash

# System Health Monitor Script
# Purpose: Monitor CPU, memory, disk usage and log results
# Author: GiulianoErcole
# Date: October 8, 2025

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
LOG_DIR="$HOME/system_logs"
LOG_FILE="$LOG_DIR/system_health_$(date +%Y%m%d).log"
ALERT_FILE="$LOG_DIR/alerts.log"

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=85

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to print colored output
print_status() {
    local status=$1
    local message=$2
    
    case $status in
        "OK")
            echo -e "${GREEN}[OK]${NC} $message"
            ;;
        "WARNING")
            echo -e "${YELLOW}[WARNING]${NC} $message"
            ;;
        "CRITICAL")
            echo -e "${RED}[CRITICAL]${NC} $message"
            ;;
    esac
}

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}


# Function to check CPU usage
check_cpu() {
    echo ""
    echo "=== CPU Usage ==="
    
    # Get CPU usage (100 - idle percentage)
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
    cpu_usage=${cpu_usage%.*}  # Remove decimal part
    
    log_message "CPU Usage: ${cpu_usage}%"
    
    if [ "$cpu_usage" -ge "$CPU_THRESHOLD" ]; then
        print_status "CRITICAL" "CPU usage is ${cpu_usage}% (threshold: ${CPU_THRESHOLD}%)"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] CRITICAL: CPU usage ${cpu_usage}%" >> "$ALERT_FILE"
    else
        print_status "OK" "CPU usage is ${cpu_usage}%"
    fi
}

# Function to check memory usage
check_memory() {
    echo ""
    echo "=== Memory Usage ==="
    
    # Get memory usage percentage
    memory_usage=$(free | grep Mem | awk '{printf "%.0f", ($3/$2) * 100}')
    
    log_message "Memory Usage: ${memory_usage}%"
    
    if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]; then
        print_status "CRITICAL" "Memory usage is ${memory_usage}% (threshold: ${MEMORY_THRESHOLD}%)"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] CRITICAL: Memory usage ${memory_usage}%" >> "$ALERT_FILE"
    else
        print_status "OK" "Memory usage is ${memory_usage}%"
    fi
}

# Function to check disk usage
check_disk() {
    echo ""
    echo "=== Disk Usage ==="
    
    # Get disk usage for root partition
    disk_usage=$(df -h / | tail -1 | awk '{print $5}' | cut -d'%' -f1)
    
    log_message "Disk Usage: ${disk_usage}%"
    
    if [ "$disk_usage" -ge "$DISK_THRESHOLD" ]; then
        print_status "CRITICAL" "Disk usage is ${disk_usage}% (threshold: ${DISK_THRESHOLD}%)"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] CRITICAL: Disk usage ${disk_usage}%" >> "$ALERT_FILE"
    else
        print_status "OK" "Disk usage is ${disk_usage}%"
    fi
}

# Function to check system load
check_load() {
    echo ""
    echo "=== System Load ==="
    
    # Get 1, 5, and 15 minute load averages
    load_avg=$(uptime | awk -F'load average:' '{print $2}')
    
    log_message "System Load: ${load_avg}"
    print_status "OK" "Load average:${load_avg}"
}

# Main execution
main() {
    echo "========================================"
    echo "  System Health Check"
    echo "  $(date '+%Y-%m-%d %H:%M:%S')"
    echo "========================================"
    
    log_message "=== System Health Check Started ==="
    
    check_cpu
    check_memory
    check_disk
    check_load
    
    echo ""
    echo "========================================"
    echo "Logs saved to: $LOG_FILE"
    if [ -f "$ALERT_FILE" ]; then
        echo "Alerts logged to: $ALERT_FILE"
    fi
    echo "========================================"
    
    log_message "=== System Health Check Completed ==="
}

# Run the main function
main

































