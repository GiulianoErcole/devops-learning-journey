# Development Environment Setup

## Overview
This document outlines the setup of a Debian-based Linux development environment configured for DevOps work.

## System Specifications
- **Distribution:** Debian GNU/Linux 12 (Bookworm)
- **Shell:** Bash
- **Package Manager:** APT

## Core Tools Installed

### Version Control
- **Git** - Distributed version control system

  sudo apt install git

### Command Line Utilities

curl/wget - HTTP clients for downloading files
vim - Terminal-based text editor
tree - Directory structure visualization
htop - Interactive process viewer
net-tools - Network configuration utilities

### Installation Command

sudo apt update
sudo apt install -y git curl wget vim tree htop net-tools

### Git Configuration
- **Global Settings**

git config --global user.name "your-username"
git config --global user.email "your-email@example.com"
git config --global init.defaultBranch main
git config --global color.ui auto

### Verification
git config --list | grep user

### SSH Authentication Setup
- **Generate SSH Key Pair**

ssh-keygen -t ed25519 -C "your-email@example.com"


- **Add Public Key to GitHub**

1.) Display public key: cat ~/.ssh/id_ed25519.pub
2.) Copy the output
3.) Add to GitHub: Settings → SSH and GPG keys → New SSH key

- **Test Connection**

ssh -T git@github.com

- **Expected output:** Hi [username]! You've successfully authenticated...

### Repository Initialization
- **Local Setup**

mkdir -p ~/devops-projects
cd ~/devops-projects
mkdir devops-learning-journey
cd devops-learning-journey
git init

- **Connect to Remote**

git remote add origin git@github.com:[username]/devops-learning-journey.git
git push -u origin main


### Key Learnings
- **Linux Fundamentals**

Package management with apt
File system navigation (cd, ls, pwd, mkdir)
File operations (cat, nano, vim)
Understanding user permissions and sudo

- **Git Workflow**

Repository initialization (git init)
Staging changes (git add)
Committing with messages (git commit -m "...")
Remote repositories (git remote, git push)
Checking status (git status, git log)

- **Best Practices Established**

Professional documentation from day one
Proper Git commit messages
SSH authentication over HTTPS
Privacy-conscious configuration (using GitHub no-reply email)
Structured project organization

### Skills Demonstrated**

✅ Linux system administration basics
✅ Command-line proficiency
✅ Version control with Git/GitHub
✅ SSH key management
✅ Technical documentation
✅ Security-conscious practices

### Next Steps

- **Automate system monitoring with bash scripts**
- **Learn Docker containerization**
- **Implement CI/CD pipeline basics**


- **Project Status:** ✅ Complete
- **Date:** October 2025



























