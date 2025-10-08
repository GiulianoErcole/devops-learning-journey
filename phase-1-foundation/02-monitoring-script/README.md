# Automated System Health Monitor

## Overview
A bash-based system monitoring solution that automatically tracks CPU, memory, disk usage, and system load. Logs results hourly and alerts when thresholds are exceeded.

## Features
- ✅ Real-time CPU usage monitoring
- ✅ Memory (RAM) usage tracking
- ✅ Disk space monitoring
- ✅ System load average reporting
- ✅ Timestamped logging
- ✅ Threshold-based alerting
- ✅ Automated execution via cron
- ✅ Color-coded terminal output

## Technical Implementation

### Architecture
system_monitor.sh
├── Configuration (thresholds, paths)
├── Utility Functions (logging, colored output)
├── Monitoring Functions
│   ├── check_cpu()
│   ├── check_memory()
│   ├── check_disk()
│   └── check_load()
└── Main Orchestration

### Monitoring Metrics

| Metric | Command Used | Threshold | Alert Level |
|--------|--------------|-----------|-------------|
| CPU Usage | `top -bn1` | 80% | CRITICAL |
| Memory Usage | `free` | 80% | CRITICAL |
| Disk Usage | `df -h /` | 85% | CRITICAL |
| System Load | `uptime` | N/A | INFO |

## Installation & Setup

### Prerequisites
- Bash shell
- Standard Linux utilities (top, free, df, uptime)
- Write permissions for log directory

### Quick Start
# Clone the repository
git clone git@github.com:GiulianoErcole/devops-learning-journey.git
cd devops-learning-journey/phase-1-foundation/02-monitoring-script

# Make script executable
chmod +x system_monitor.sh

# Run manual check
./system_monitor.sh

### Automated Execution
# Edit crontab
crontab -e

# Add this line to run every hour
0 * * * * /path/to/system_monitor.sh >> /path/to/cron_output.log 2>&1

### Configuration
Edit system_monitor.sh to customize:

# Thresholds (adjust based on your needs)
CPU_THRESHOLD=80        # Alert at 80% CPU
MEMORY_THRESHOLD=80     # Alert at 80% Memory
DISK_THRESHOLD=85       # Alert at 85% Disk

# Log locations
LOG_DIR="$HOME/system_logs"

### Log Files
# Daily Health Log

Location: ~/system_logs/system_health_YYYYMMDD.log
Content: All monitoring checks with timestamps
Rotation: New file created daily

### Alert Log

Location: ~/system_logs/alerts.log
Content: Only CRITICAL events
Use Case: Quick problem identification

### Cron Output Log

Location: ~/system_logs/cron_output.log
Content: Script execution output from cron
Purpose: Debugging automated runs

### Usage Examples
# Manual Execution
./system_monitor.sh

# View Today's Logs
cat ~/system_logs/system_health_$(date +%Y%m%d).log

# Check Recent Alerts
tail -20 ~/system_logs/alerts.log

# Monitor in Real-Time
watch -n 60 ./system_monitor.sh


### Skills Demonstrated
# Bash Scripting

-Variables and configuration management
-Functions and code organization
-Conditional logic (if/then/else)
-Case statements for pattern matching
-Command substitution and piping
-String manipulation

# System Administration

-Process monitoring (top)
-Memory analysis (free)
-Disk space management (df)
-System load interpretation (uptime)
-Log file management
-File permissions (chmod)

# Automation

-Cron job configuration
-Scheduled task execution
-Output redirection
-Error handling (2>&1)

# DevOps Practices

-Threshold-based alerting
-Centralized logging
-Colored output for clarity
-Self-documenting code with comments
-Configurable parameters

### Real-World Applications
# This project simulates production monitoring tasks:

-Production Servers: Early warning system for resource exhaustion
-Development Environments: Track resource usage during testing
-CI/CD Pipelines: Monitor build server health
-Incident Response: Historical data for troubleshooting

### Future Enhancements
# Potential improvements for learning:

 -Email/Slack notifications on critical alerts
 -Graphical dashboard (integrate with Grafana)
 -Historical trend analysis
 -Multi-server monitoring
 -Integration with monitoring platforms (Prometheus)
 -Network connectivity checks
 -Service health checks (nginx, docker, etc.)

### Troubleshooting
# Script Not Running

# Check if executable
ls -l system_monitor.sh

# Make executable if needed
chmod +x system_monitor.sh

### Cron Not Working
# Verify cron service is running
systemctl status cron

# Check cron logs
grep CRON /var/log/syslog

# Verify crontab entry
crontab -l

### Permissions Issues
# Ensure log directory exists and is writable
mkdir -p ~/system_logs
chmod 755 ~/system_logs

# Key Learnings
### Technical Skills

-Writing production-ready bash scripts
-Understanding system resource metrics
-Implementing monitoring best practices
-Automating repetitive tasks
-Managing log files effectively

# DevOps Mindset

-Proactive vs reactive monitoring
-Importance of thresholds and alerting
-Value of automated health checks
-Documentation as code


# Project Status: ✅ Complete
# Completion Date: October 8th,2025
# Time Invested: ~3 hours
# Next Project: Containerized web application with Docker




