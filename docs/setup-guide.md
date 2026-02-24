# Setup Guide

## Prerequisites
- Ubuntu 22.04/24.04 VPS with SSH access
- Basic Linux command line knowledge
- Telegram Bot Token from [@BotFather](https://t.me/botfather)
- DeepSeek API Key from [DeepSeek Platform](https://platform.deepseek.com/)

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/armando-ai-assistant.git
   cd armando-ai-assistant
   ```

2. **Review and customize configuration:**
   ```bash
   # Review security configurations
   nano configs/security/ssh_config.example
   nano configs/security/ufw_rules.example
   nano configs/security/fail2ban.local.example
   
   # Customize OpenClaw configuration
   nano configs/openclaw/config.yaml.example
   ```

3. **Run the setup script (review before running):**
   ```bash
   chmod +x scripts/setup-vps.sh
   ./scripts/setup-vps.sh
   ```

4. **Configure environment variables:**
   ```bash
   export TELEGRAM_BOT_TOKEN="your_bot_token"
   export DEEPSEEK_API_KEY="your_api_key"
   export OPENCLAW_WORKSPACE="/path/to/workspace"
   ```

5. **Set up the service:**
   ```bash
   sudo cp configs/systemd/openclaw-agent.service.example /etc/systemd/system/openclaw-agent.service
   sudo nano /etc/systemd/system/openclaw-agent.service  # Customize as needed
   
   sudo systemctl daemon-reload
   sudo systemctl enable openclaw-agent
   sudo systemctl start openclaw-agent
   sudo systemctl status openclaw-agent
   ```

## Detailed Setup

### Security Configuration
1. **SSH Hardening:**
   - Edit `/etc/ssh/sshd_config`
   - Set `PermitRootLogin no`
   - Set `PasswordAuthentication no`
   - Restart SSH: `sudo systemctl restart sshd`

2. **Firewall Setup:**
   ```bash
   sudo ufw allow ssh
   sudo ufw allow 22/tcp
   sudo ufw --force enable
   sudo ufw status verbose
   ```

3. **Fail2Ban Configuration:**
   ```bash
   sudo cp configs/security/fail2ban.local.example /etc/fail2ban/jail.local
   sudo nano /etc/fail2ban/jail.local  # Customize as needed
   sudo systemctl restart fail2ban
   sudo systemctl status fail2ban
   ```

### OpenClaw Configuration
1. **Install OpenClaw:**
   ```bash
   # Follow OpenClaw installation guide from https://docs.openclaw.ai/
   ```

2. **Configure workspace:**
   ```bash
   mkdir -p /opt/openclaw
   cp -r configs/openclaw/* /opt/openclaw/
   ```

3. **Set permissions:**
   ```bash
   sudo useradd -m -s /bin/bash openclaw
   sudo chown -R openclaw:openclaw /opt/openclaw
   ```

## Verification

1. **Check service status:**
   ```bash
   sudo systemctl status openclaw-agent
   ```

2. **View logs:**
   ```bash
   sudo journalctl -u openclaw-agent -f
   ```

3. **Test Telegram bot:**
   - Send `/start` to your bot
   - Verify response

## Troubleshooting

If the service fails to start:
```bash
# Check for errors
sudo journalctl -u openclaw-agent -xe --no-pager | tail -20

# Check port conflicts
sudo ss -tulpn | grep :18789

# Run manually for debugging
cd /opt/openclaw
sudo -u openclaw node dist/index.js gateway --verbose
```

## Security Notes

⚠️ **Important Security Practices:**
- Never commit API keys or secrets to version control
- Use environment variables for sensitive data
- Regularly update system packages
- Monitor system logs for suspicious activity
- Implement regular backups

## Next Steps

After successful setup:
1. Test basic functionality
2. Review and customize skills
3. Set up monitoring and alerts
4. Implement backup strategy
5. Consider additional security hardening
