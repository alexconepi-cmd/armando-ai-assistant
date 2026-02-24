#!/bin/bash

# Armando AI Assistant - VPS Setup Script
# ========================================
# This script sets up a basic VPS configuration for the Armando AI Assistant
# WARNING: Review and customize before running on production systems

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}   Armando AI Assistant - VPS Setup     ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root${NC}"
   echo -e "${YELLOW}Try: sudo bash $0${NC}"
   exit 1
fi

# Configuration
USERNAME="openclaw"
WORKSPACE_DIR="/opt/openclaw"
LOG_DIR="/var/log/openclaw"
BACKUP_DIR="/backup/openclaw"

echo -e "${BLUE}[1/10] System Update${NC}"
apt-get update
apt-get upgrade -y

echo -e "${BLUE}[2/10] Installing Dependencies${NC}"
apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    wget \
    ufw \
    fail2ban \
    htop \
    nano \
    tmux \
    cron \
    logrotate

echo -e "${BLUE}[3/10] Creating System User${NC}"
if id "$USERNAME" &>/dev/null; then
    echo -e "${YELLOW}User $USERNAME already exists${NC}"
else
    useradd -m -s /bin/bash "$USERNAME"
    echo -e "${GREEN}User $USERNAME created${NC}"
fi

echo -e "${BLUE}[4/10] Creating Directory Structure${NC}"
mkdir -p "$WORKSPACE_DIR"
mkdir -p "$LOG_DIR"
mkdir -p "$BACKUP_DIR"
mkdir -p "$WORKSPACE_DIR/configs"
mkdir -p "$WORKSPACE_DIR/scripts"
mkdir -p "$WORKSPACE_DIR/logs"

# Set permissions
chown -R "$USERNAME:$USERNAME" "$WORKSPACE_DIR"
chown -R "$USERNAME:$USERNAME" "$LOG_DIR"
chmod 755 "$WORKSPACE_DIR"
chmod 755 "$LOG_DIR"

echo -e "${BLUE}[5/10] Configuring Firewall${NC}"
ufw --force enable
ufw allow ssh
ufw allow 22/tcp
ufw --force reload
ufw status verbose

echo -e "${BLUE}[6/10] Configuring SSH Security${NC}"
# Backup original sshd config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Basic SSH hardening
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

systemctl restart sshd

echo -e "${BLUE}[7/10] Setting up Log Rotation${NC}"
cat > /etc/logrotate.d/openclaw << EOF
$LOG_DIR/*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 640 $USERNAME $USERNAME
    sharedscripts
    postrotate
        systemctl reload openclaw-agent > /dev/null 2>&1 || true
    endscript
}
