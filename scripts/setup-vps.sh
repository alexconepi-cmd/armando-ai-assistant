#!/bin/bash

# Armando AI Assistant - VPS Setup Script
# This script sets up a basic VPS configuration for the Armando AI Assistant
# WARNING: Review and customize before running on production systems

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}   Armando AI Assistant - VPS Setup     ${NC}"
echo -e "${GREEN}=========================================${NC}"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}This script must be run as root${NC}"
   exit 1
fi

# Configuration
USERNAME="openclaw"
WORKSPACE_DIR="/opt/openclaw"
LOG_DIR="/var/log/openclaw"
BACKUP_DIR="/backup/openclaw"

echo -e "${YELLOW}[1/8] System Update${NC}"
apt-get update
apt-get upgrade -y

echo -e "${YELLOW}[2/8] Installing Dependencies${NC}"
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

echo -e "${YELLOW}[3/8] Creating System User${NC}"
if id "$USERNAME" &>/dev/null; then
    echo -e "${YELLOW}User $USERNAME already exists${NC}"
else
    useradd -m -s /bin/bash "$USERNAME"
    echo -e "${GREEN}User $USERNAME created${NC}"
fi

echo -e "${YELLOW}[4/8] Creating Directory Structure${NC}"
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

echo -e "${YELLOW}[5/8] Configuring Firewall${NC}"
ufw --force enable
ufw allow ssh
ufw allow 80/tcp   # HTTP (for future web interface)
ufw allow 443/tcp  # HTTPS (for future web interface)
ufw --force reload
ufw status verbose

echo -e "${YELLOW}[6/8] Configuring SSH Security${NC}"
# Backup original sshd config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Basic SSH hardening
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config

systemctl restart sshd

echo -e "${YELLOW}[7/8] Setting up Log Rotation${NC}"
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
EOF

echo -e "${YELLOW}[8/8] Creating Backup Cron Job${NC}"
cat > /etc/cron.daily/openclaw-backup << 'EOF'
#!/bin/bash
BACKUP_DIR="/backup/openclaw"
WORKSPACE_DIR="/opt/openclaw"
CONFIG_DIR="/etc/openclaw"
DATE=$(date +%Y%m%d)

# Create backup
tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" \
    "$WORKSPACE_DIR/configs" \
    "$WORKSPACE_DIR/scripts" \
    "$CONFIG_DIR" \
    2>/dev/null || true

# Remove backups older than 30 days
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +30 -delete
EOF

chmod +x /etc/cron.daily/openclaw-backup

echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}        Setup Complete!                 ${NC}"
echo -e "${GREEN}=========================================${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Add your SSH key to $USERNAME user:"
echo "   mkdir -p /home/$USERNAME/.ssh"
echo "   nano /home/$USERNAME/.ssh/authorized_keys"
echo ""
echo "2. Install OpenClaw:"
echo "   sudo -u $USERNAME bash"
echo "   cd /opt/openclaw"
echo "   # Follow OpenClaw installation guide"
echo ""
echo "3. Configure environment variables:"
echo "   nano /home/$USERNAME/.bashrc"
echo "   Add: export TELEGRAM_BOT_TOKEN='your_token'"
echo "   Add: export DEEPSEEK_API_KEY='your_key'"
echo ""
echo "4. Review security configuration in configs/security/"
echo ""
echo -e "${RED}IMPORTANT:${NC}"
echo "- Never commit API keys or secrets to Git"
echo "- Use environment variables for sensitive data"
echo "- Regularly update system and monitor logs"
echo "- Test backups regularly"

echo -e "${GREEN}Setup completed at $(date)${NC}"