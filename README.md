# Armando - AI Assistant for Career Development & Automation 🤖

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![OpenClaw](https://img.shields.io/badge/OpenClaw-Agent-orange)
![Linux](https://img.shields.io/badge/Linux-Ubuntu%20Server-green)
![Telegram](https://img.shields.io/badge/Telegram-Bot%20API-blue)
![Status](https://img.shields.io/badge/Status-24%2F7%20Online-brightgreen)
![DevOps](https://img.shields.io/badge/DevOps-Basics-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

**A fully configured AI assistant running 24/7 on a VPS, specializing in career coaching, task automation, and technical mentorship. Built from scratch in 5 days as a learning project.**

## 🎯 Overview

Armando is an AI assistant designed to provide continuous support for career development in tech. This project demonstrates practical skills in DevOps, system integration, and AI automation - all implemented in under a week.

## ✨ Features

### 🤖 **AI & Automation**
- **24/7 AI Assistant**: Persistent session configuration for continuous operation
- **Career Coaching**: CV optimization, interview preparation, job search strategies
- **Task Automation**: Email filtering, calendar management, notification systems
- **Technical Mentorship**: Code reviews, learning paths, project guidance
- **Conversational Memory**: Context-aware conversations with persistent history

### 🔧 **Technical Implementation**
- **VPS Configuration**: Ubuntu Server with security hardening (UFW firewall, SSH key authentication)
- **System Integration**: OpenClaw + DeepSeek API + Telegram Bot API seamless integration
- **Service Management**: systemd services for reliable 24/7 operation with auto-restart
- **Memory Persistence**: Workspace and conversation history management via file-based storage
- **Prompt Engineering**: Custom skill development for specific use cases

### 🛠️ **DevOps & Infrastructure**
- **Security First**: SSH key authentication only, firewall rules, non-root user, fail2ban setup
- **Monitoring**: Basic system health checks, resource monitoring, and logging
- **Backup Systems**: Automated configuration backup and recovery procedures
- **Automated Setup**: Bash scripts for reproducible deployment and configuration
- **Service Reliability**: Proper logging, error handling, and recovery mechanisms

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    User Interaction Layer                    │
│  ┌────────────┐    ┌────────────┐    ┌─────────────────┐   │
│  │  Telegram  │◄──►│  WhatsApp  │◄──►│  Web Interface  │   │
│  │    Bot     │    │ Integration│    │   (Future)      │   │
│  └────────────┘    └────────────┘    └─────────────────┘   │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│                 OpenClaw Agent Layer                         │
│  ┌─────────────────────────────────────────────────────┐   │
│  │  Core Agent: Memory, Skills, Workspace Management   │   │
│  │  • File-based persistence                          │   │
│  │  • Skill routing and execution                     │   │
│  │  • Context management                              │   │
│  └─────────────────────────────────────────────────────┘   │
└───────────────────────────┬─────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│                    AI Service Layer                          │
│  ┌────────────┐    ┌────────────┐    ┌─────────────────┐   │
│  │ DeepSeek   │    │  Gemini    │    │  OpenAI (Future)│   │
│  │   API      │    │    API     │    │                 │   │
│  └────────────┘    └────────────┘    └─────────────────┘   │
└─────────────────────────────────────────────────────────────┘
                            │
┌───────────────────────────▼─────────────────────────────────┐
│                 Infrastructure Layer                         │
│  ┌────────────┐    ┌────────────┐    ┌─────────────────┐   │
│  │ Ubuntu VPS │    │  systemd   │    │  File System    │   │
│  │  22.04 LTS │    │  Services  │    │   Storage       │   │
│  └────────────┘    └────────────┘    └─────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

**Data Flow:**
1. **Input**: User message via Telegram → Telegram Bot API
2. **Processing**: OpenClaw agent processes with context from memory
3. **AI Generation**: Request to DeepSeek API with engineered prompt
4. **Response**: Formatted reply sent back through Telegram
5. **Persistence**: Conversation history saved to workspace files

## 🚀 Getting Started

### Prerequisites
- Ubuntu 22.04+ VPS (2GB RAM minimum, 20GB SSD)
- Python 3.8 or higher
- OpenClaw installation
- Telegram Bot Token (from [@BotFather](https://t.me/botfather))
- DeepSeek API Key (from [DeepSeek Platform](https://platform.deepseek.com/))

### Basic Setup

```bash
# Clone this repository
git clone https://github.com/<your-username>/armando-ai-assistant.git
cd armando-ai-assistant

# Make setup scripts executable
chmod +x scripts/*.sh

# Run initial VPS setup (review before running!)
./scripts/setup-vps.sh

# Review and customize configuration files
nano configs/openclaw/config.yaml.example
```

### Configuration Steps

1. **Security Configuration** (`configs/security/`):
   - Update SSH keys in `ssh_config.example`
   - Configure firewall rules in `ufw_rules.example`
   - Set up fail2ban using `fail2ban.local.example`

2. **API Integration**:
   ```bash
   # Set environment variables
   export TELEGRAM_BOT_TOKEN="your_telegram_bot_token"
   export DEEPSEEK_API_KEY="your_deepseek_api_key"
   export OPENCLAW_WORKSPACE="/path/to/workspace"
   ```

3. **Service Setup**:
   ```bash
   # Copy and customize systemd service file
   sudo cp configs/systemd/openclaw-agent.service.example /etc/systemd/system/openclaw-agent.service
   sudo nano /etc/systemd/system/openclaw-agent.service
   
   # Enable and start the service
   sudo systemctl daemon-reload
   sudo systemctl enable openclaw-agent
   sudo systemctl start openclaw-agent
   
   # Check status
   sudo systemctl status openclaw-agent
   ```

4. **Verification**:
   ```bash
   # Check logs
   sudo journalctl -u openclaw-agent -f
   
   # Test Telegram bot
   # Send a message to your configured bot
   ```

## 📁 Project Structure

```
armando-ai-assistant/
├── .github/                    # GitHub Actions workflows
├── configs/                    # Configuration templates
│   ├── openclaw/              # OpenClaw configuration
│   │   └── config.yaml.example
│   ├── systemd/               # Service management
│   │   └── openclaw-agent.service.example
│   └── security/              # Security configurations
│       ├── ssh_config.example
│       ├── ufw_rules.example
│       └── fail2ban.local.example
├── scripts/                   # Automation scripts
│   └── setup-vps.sh           # Initial VPS setup
├── docs/                      # Documentation
│   ├── architecture.md        # System architecture
│   └── setup-guide.md         # Setup instructions
├── examples/                  # Usage examples
│   └── basic-usage.md         # Basic usage guide
├── tests/                     # Test scripts
├── .gitignore                 # Git ignore rules
├── LICENSE                    # MIT License
├── README.md                  # This file
└── CHANGELOG.md               # Project changelog
```

## 🔧 Technical Details

### Security Implementation
- **SSH Hardening**: Key-based authentication only, root login disabled
- **Firewall Configuration**: UFW with minimal required ports
- **User Management**: Non-root user with sudo privileges
- **Service Isolation**: Dedicated user for OpenClaw agent
- **Intrusion Prevention**: Fail2Ban for SSH protection

### Performance Considerations
- **Resource Monitoring**: Basic monitoring for CPU, memory, disk usage
- **Log Rotation**: Configured to prevent disk space issues
- **Backup Strategy**: Regular backups of configurations
- **Error Handling**: Graceful degradation and recovery procedures

## 🎓 Learning Outcomes

This project demonstrates practical skills in:

### 🏗️ **DevOps & System Administration**
- VPS management and security hardening
- Service configuration with systemd
- Network security and firewall management
- Backup and recovery strategies

### 🔌 **System Integration**
- REST API integration (Telegram, DeepSeek)
- Multi-service architecture coordination
- File system management and persistence
- Environment-based configuration

### 🤖 **AI & Automation**
- Prompt engineering for specific tasks
- Conversational AI with memory persistence
- Custom skill development
- Agent behavior tuning

## 🔒 Security Notes

⚠️ **CRITICAL SECURITY PRACTICES**:

1. **Never commit sensitive data**:
   ```bash
   # Use .gitignore for secrets
   *.key
   *.pem
   *.env
   configs/secrets/
   ```

2. **Use environment variables**:
   ```bash
   export TELEGRAM_BOT_TOKEN="your_token"
   export DEEPSEEK_API_KEY="your_key"
   ```

3. **Regular security updates**:
   ```bash
   sudo apt install unattended-upgrades
   sudo dpkg-reconfigure unattended-upgrades
   ```

## 🚨 Troubleshooting

### Common Issues

1. **Service won't start**:
   ```bash
   sudo journalctl -u openclaw-agent -xe
   sudo chown -R openclaw:openclaw /opt/openclaw
   ```

2. **Telegram bot not responding**:
   ```bash
   echo $TELEGRAM_BOT_TOKEN
   # Verify bot is active with @BotFather
   ```

3. **Connection issues**:
   ```bash
   sudo ufw status
   curl -I https://api.deepseek.com
   ```

### Debug Mode
```bash
cd /opt/openclaw
node dist/index.js gateway --verbose
```

## 📈 Future Enhancements

### Planned Features
- Web dashboard for monitoring
- WhatsApp integration
- Email automation
- Calendar integration
- Advanced analytics
- Multi-agent architecture
- Docker containerization
- Kubernetes deployment

### Technical Improvements
- Database integration
- API rate limiting
- Advanced monitoring
- Automated testing
- CI/CD pipeline
- Configuration management

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Guidelines
- Follow existing code style and structure
- Update documentation for new features
- Add tests where applicable
- Ensure no sensitive data is committed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OpenClaw](https://openclaw.ai/) for the agent framework
- [DeepSeek](https://www.deepseek.com/) for AI capabilities
- Telegram for their Bot API
- The open-source community for resources and inspiration

## 📚 Resources

- [OpenClaw Documentation](https://docs.openclaw.ai/)
- [Ubuntu Server Guide](https://ubuntu.com/server/docs)
- [Telegram Bot API](https://core.telegram.org/bots/api)
- [DeepSeek API Docs](https://platform.deepseek.com/api-docs/)

---

*Built with a focus on practical learning and real-world application.*
