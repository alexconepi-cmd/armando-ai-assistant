# Basic Usage Examples

## Starting the Assistant

### Method 1: Manual Start
```bash
# Navigate to OpenClaw directory
cd /opt/openclaw

# Start the gateway
node dist/index.js gateway

# For debugging with verbose output
node dist/index.js gateway --verbose
```

### Method 2: Using systemd Service
```bash
# Start the service
sudo systemctl start openclaw-agent

# Enable automatic startup on boot
sudo systemctl enable openclaw-agent

# Check service status
sudo systemctl status openclaw-agent

# View logs
sudo journalctl -u openclaw-agent -f
```

## Telegram Commands

### Basic Commands
- `/start` - Initialize conversation and welcome message
- `/help` - Show available commands and usage information
- `/status` - Check system status and uptime
- `/memory` - View recent conversation history

### Utility Commands
- `/weather [location]` - Get weather information
- `/healthcheck` - Perform system health check
- `/skills` - List available skills

### Development Commands
- `/debug` - Toggle debug mode
- `/logs` - View recent logs
- `/restart` - Restart the agent (if configured)

## Common Interactions

### Career Coaching
```
User: Can you review my CV?
Assistant: I'd be happy to help review your CV. Please share the key sections you'd like me to focus on.

User: I need interview preparation tips
Assistant: Let's work on interview preparation. What type of position are you interviewing for?
```

### Task Automation
```
User: Remind me to check emails at 10 AM
Assistant: I'll remind you to check emails at 10 AM. Would you like daily reminders?

User: Schedule a meeting for tomorrow
Assistant: I can help schedule meetings. Please provide the details: time, participants, and agenda.
```

### Technical Assistance
```
User: Help me debug this Python code
Assistant: Share the code and the error message. I'll help you identify the issue.

User: Explain how SSH keys work
Assistant: SSH keys provide secure authentication without passwords. Would you like a detailed explanation?
```

## Monitoring and Maintenance

### Checking System Status
```bash
# Check if agent is running
ps aux | grep openclaw-gateway | grep -v grep

# Check resource usage
top -p $(pgrep -f openclaw-gateway)

# Check disk space for workspace
df -h /opt/openclaw
```

### Viewing Logs
```bash
# Real-time log viewing
sudo journalctl -u openclaw-agent -f

# View last 50 log entries
sudo journalctl -u openclaw-agent -n 50

# View logs from specific time
sudo journalctl -u openclaw-agent --since "2026-02-24 10:00:00"
```

### Backup Procedures
```bash
# Backup configuration
tar -czf /backup/openclaw-config-$(date +%Y%m%d).tar.gz /opt/openclaw/configs/

# Backup workspace
tar -czf /backup/openclaw-workspace-$(date +%Y%m%d).tar.gz /opt/openclaw/workspace/
```

## Troubleshooting Common Issues

### Agent Not Responding
1. Check if service is running:
   ```bash
   sudo systemctl status openclaw-agent
   ```

2. Check for port conflicts:
   ```bash
   sudo ss -tulpn | grep :18789
   ```

3. Restart the service:
   ```bash
   sudo systemctl restart openclaw-agent
   ```

### Telegram Bot Not Working
1. Verify bot token:
   ```bash
   echo $TELEGRAM_BOT_TOKEN
   ```

2. Check bot status with @BotFather
3. Verify network connectivity:
   ```bash
   curl -I https://api.telegram.org
   ```

### High Resource Usage
1. Monitor resource consumption:
   ```bash
   htop
   df -h
   ```

2. Check for memory leaks:
   ```bash
   free -h
   ```

3. Restart to clear memory:
   ```bash
   sudo systemctl restart openclaw-agent
   ```

## Best Practices

### Regular Maintenance
- Monitor logs daily for errors
- Apply security updates weekly
- Perform monthly backups
- Review configuration quarterly

### Security Practices
- Never share API keys or tokens
- Use strong SSH key passphrases
- Regularly rotate credentials
- Monitor authentication attempts

### Performance Optimization
- Keep conversation history manageable
- Implement caching for frequent queries
- Monitor and adjust resource limits
- Regular database cleanup (if applicable)

## Getting Help

### Documentation
- Review `docs/` directory for detailed guides
- Check `README.md` for project overview
- Refer to `CHANGELOG.md` for updates

### Support Channels
- GitHub Issues for bug reports
- Project documentation for FAQs
- Community forums for discussions

### Emergency Procedures
1. **Service Down**: Check logs and restart
2. **Security Breach**: Rotate credentials immediately
3. **Data Loss**: Restore from latest backup
4. **Performance Issues**: Scale resources or optimize
