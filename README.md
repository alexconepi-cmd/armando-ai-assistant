# Armando - AI Assistant for Career Development & Automation 🤖🦞

![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![OpenClaw](https://img.shields.io/badge/OpenClaw-Agent-orange)
![Linux](https://img.shields.io/badge/Linux-Ubuntu%20Server-green)
![Telegram](https://img.shields.io/badge/Telegram-Bot%20API-blue)
![Status](https://img.shields.io/badge/Status-24%2F7%20Online-brightgreen)
![DevOps](https://img.shields.io/badge/DevOps-Basics-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

**Personal AI assistant configured for 24/7 operation, specializing in career coaching, task automation, and technical mentorship. Built from scratch in 5 days as a learning project.**

## 🎯 Overview

Armando is a fully configured AI assistant running on a VPS, designed to provide continuous support for career development in tech. This project demonstrates practical skills in DevOps, system integration, and AI automation - all learned and implemented in under a week.

## ✨ Features

### 🤖 **AI & Automation**
- **24/7 AI Assistant**: Persistent session configuration for continuous operation
- **Career Coaching**: CV optimization, interview preparation, job search strategies
- **Task Automation**: Email filtering, calendar management, notification systems
- **Technical Mentorship**: Code reviews, learning paths, project guidance
- **Conversational Memory**: Context-aware conversations with persistent history

### 🔧 **Technical Implementation**
- **VPS Configuration**: Ubuntu Server 22.04 with security hardening (UFW firewall, SSH key authentication, user management)
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
git clone https://github.com/alexconepi-cmd/armando-ai-assistant.git
cd armando-ai-assistant

# Make setup scripts executable
chmod +x scripts/*.sh

# Run initial VPS setup (review before running!)
./scripts/setup-vps.sh

# Review and customize configuration files
nano configs/openclaw/config.yaml
```

### Configuration Steps

1. **Security Configuration** (`configs/security/`):
   - Update SSH keys in `ssh_config`
   - Configure firewall rules in `ufw_rules`
   - Set up fail2ban if needed

2. **API Integration**:
   ```bash
   # Set environment variables (add to ~/.bashrc or use .env file)
   export TELEGRAM_BOT_TOKEN="your_telegram_bot_token"
   export DEEPSEEK_API_KEY="your_deepseek_api_key"
   export OPENCLAW_WORKSPACE="/path/to/workspace"
   ```

3. **Service Setup**:
   ```bash
   # Copy systemd service file
   sudo cp configs/systemd/openclaw-agent.service /etc/systemd/system/
   
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
   # Send a message to your bot on Telegram
   ```

## 📁 Project Structure

```
armando-ai-assistant/
├── .github/
│   └── workflows/          # GitHub Actions for CI/CD
├── configs/                # Configuration templates
│   ├── openclaw/          # OpenClaw configuration
│   │   ├── config.yaml    # Main agent configuration
│   │   ├── skills/        # Custom skill definitions
│   │   └── memory/        # Memory setup templates
│   ├── systemd/           # Service management
│   │   ├── openclaw-agent.service
│   │   └── openclaw-agent.timer
│   └── security/          # Security configurations
│       ├── ssh_config
│       ├── ufw_rules
│       └── fail2ban.local
├── scripts/               # Automation and utility scripts
│   ├── setup-vps.sh       # Initial VPS setup and hardening
│   ├── deploy-agent.sh    # Agent deployment script
│   ├── backup-config.sh   # Configuration backup
│   ├── monitor-system.sh  # System monitoring
│   └── update-agent.sh    # Agent update procedure
├── docs/                  # Comprehensive documentation
│   ├── architecture.md    # Detailed architecture
│   ├── setup-guide.md     # Step-by-step setup
│   ├── security-guide.md  # Security best practices
│   ├── troubleshooting.md # Common issues and solutions
│   └── api-reference.md   # API integration guide
├── examples/              # Usage examples and tutorials
│   ├── basic-usage.md     # Getting started with the agent
│   ├── custom-skill.md    # Creating custom skills
│   └── integration-guide.md # Integrating with other services
├── tests/                 # Test scripts
│   └── basic-test.sh      # Basic functionality tests
├── .gitignore             # Git ignore rules
├── LICENSE                # MIT License
├── README.md              # This file
└── CHANGELOG.md           # Project changelog
```

## 🔧 Technical Details

### Security Implementation
- **SSH Hardening**: Key-based authentication only, root login disabled
- **Firewall Configuration**: UFW with minimal required ports (22, optional 80/443)
- **User Management**: Non-root user with sudo privileges
- **Service Isolation**: Dedicated user for OpenClaw agent
- **Regular Updates**: Automated security updates enabled

### Performance Considerations
- **Resource Monitoring**: Basic monitoring for CPU, memory, disk usage
- **Log Rotation**: Configured to prevent disk space issues
- **Backup Strategy**: Regular backups of configurations and workspace
- **Error Handling**: Graceful degradation and recovery procedures

### Scalability Features
- **Modular Design**: Easy to add new skills or integrations
- **Configuration Management**: Environment-based configuration
- **Service Management**: Proper init system integration
- **Monitoring Ready**: Structured logs for external monitoring

## 🎓 Learning Outcomes & Skills Demonstrated

This project was built from scratch in 5 days and demonstrates practical skills in:

### 🏗️ **DevOps & System Administration**
- **VPS Management**: Ubuntu Server setup, maintenance, and security
- **Service Configuration**: systemd services for 24/7 operation
- **Security Hardening**: SSH, firewall, user permissions, best practices
- **Backup & Recovery**: Configuration backup strategies

### 🔌 **System Integration**
- **API Integration**: REST APIs consumption (Telegram, DeepSeek)
- **Multi-Service Architecture**: Coordinating multiple services
- **File System Management**: Persistent storage and workspace organization
- **Network Configuration**: Port management, firewall rules

### 🤖 **AI & Automation**
- **Prompt Engineering**: Crafting effective prompts for specific tasks
- **Conversational AI**: Context management and memory persistence
- **Skill Development**: Creating custom automation workflows
- **Agent Configuration**: Tuning AI behavior and responses

### 📊 **Project Management**
- **Rapid Learning**: Acquiring new skills quickly under time constraints
- **Problem Solving**: Using AI tools (Gemini, ChatGPT) strategically for technical challenges
- **Documentation**: Comprehensive docs for reproducibility
- **Version Control**: Professional Git workflow and repository management

## 🔒 Security Notes

⚠️ **CRITICAL SECURITY PRACTICES**:

1. **Never commit sensitive data**:
   ```bash
   # Add to .gitignore
   *.key
   *.pem
   *.env
   configs/secrets/
   ```

2. **Use environment variables**:
   ```bash
   # Store in ~/.bashrc or separate .env file
   export TELEGRAM_BOT_TOKEN="your_token_here"
   export DEEPSEEK_API_KEY="your_key_here"
   ```

3. **Regular security updates**:
   ```bash
   # Enable automatic security updates
   sudo apt install unattended-upgrades
   sudo dpkg-reconfigure --priority=low unattended-upgrades
   ```

4. **Monitor access logs**:
   ```bash
   # Check authentication attempts
   sudo tail -f /var/log/auth.log
   ```

## 🚨 Troubleshooting

### Common Issues

1. **Service won't start**:
   ```bash
   # Check logs
   sudo journalctl -u openclaw-agent -xe
   
   # Verify permissions
   sudo chown -R openclaw:openclaw /opt/openclaw
   ```

2. **Telegram bot not responding**:
   ```bash
   # Verify token is set
   echo $TELEGRAM_BOT_TOKEN
   
   # Check bot is started with BotFather
   # Send /start to @BotFather
   ```

3. **High resource usage**:
   ```bash
   # Monitor resources
   htop
   df -h
   ```

4. **Connection issues**:
   ```bash
   # Check firewall
   sudo ufw status
   
   # Test API connectivity
   curl -I https://api.deepseek.com
   ```

### Debug Mode
```bash
# Run agent in foreground for debugging
cd /opt/openclaw
python3 -m openclaw --config configs/openclaw/config.yaml --verbose
```

## 📈 Future Enhancements

### Planned Features
- [ ] Web dashboard for monitoring and control
- [ ] WhatsApp integration via WhatsApp Web API
- [ ] Email automation (send/receive/parse)
- [ ] Calendar integration (Google Calendar, Outlook)
- [ ] Advanced analytics and reporting
- [ ] Multi-agent architecture for specialized tasks
- [ ] Docker containerization for easier deployment
- [ ] Kubernetes configuration for scaling

### Technical Improvements
- [ ] Database integration (PostgreSQL/Redis)
- [ ] API rate limiting and caching
- [ ] Advanced monitoring (Prometheus/Grafana)
- [ ] Automated testing suite
- [ ] CI/CD pipeline
- [ ] Configuration management (Ansible/Terraform)

## 🤝 Contributing

While this is primarily a personal project, contributions are welcome! Here's how:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add some amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Contribution Guidelines
- Follow existing code style and structure
- Update documentation for new features
- Add tests where applicable
- Ensure no sensitive data is committed

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2026 Alex Conesa Piñeiro

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## 👨‍💻 Author

**Alex Conesa Piñeiro** - Junior Developer specializing in Automation & AI Agents

- 🎯 **Focus**: Automation, AI Agents, DevOps, System Integration
- 📍 **Location**: Getafe, Madrid, Spain
- 🚗 **Mobility**: Driving license + own vehicle
- 🌍 **Work Authorization**: Spanish/EU work permit
- 🔗 **LinkedIn**: [linkedin.com/in/alex-conesa-piñeiro](https://www.linkedin.com/in/alex-conesa-pi%C3%B1eiro/)
- 📧 **Email**: alexconepi@gmail.com
- 🐙 **GitHub**: [github.com/alexconepi-cmd](https://github.com/alexconepi-cmd)

### About This Project
This project was built as a hands-on learning experience to demonstrate practical skills in:
- **Rapid skill acquisition**: Learned and implemented complex systems in 5 days
- **Problem-solving with AI**: Strategic use of tools like Gemini and ChatGPT
- **Real-world DevOps**: From zero to production-ready system
- **Project ownership**: Complete lifecycle from idea to 24/7 operation

## 🙏 Acknowledgments

- **[OpenClaw](https://openclaw.ai/)** for providing an amazing open-source agent framework
- **[DeepSeek](https://www.deepseek.com/)** for powerful and accessible AI capabilities
- **Google Gemini & OpenAI ChatGPT** for being invaluable learning and problem-solving tools
- **The open-source community** for endless resources, tutorials, and inspiration
- **Telegram** for their excellent Bot API and platform

## 📚 Resources & References

### Learning Resources Used
- [OpenClaw Documentation](https://docs.openclaw.ai/)
- [DigitalOcean VPS Tutorials](https://www.digitalocean.com/community/tutorials)
- [Linux Server Security Hardening Guide](https://github.com/imthenachoman/How-To-Secure-A-Linux-Server)
- [Telegram Bot API Documentation](https://core.telegram.org/bots/api)
- [DeepSeek API Documentation](https://platform.deepseek.com/api-docs/)

### Inspiration
- This project was inspired by the need to create tangible proof of skills for a tech career transition
- The "learn by doing" philosophy of building something real rather than just following tutorials
- The Cuban saying: "Con lo que haya, se resuelve" (With what's available, we solve it)

---

*"Built with the Cuban spirit of resilience - where limitations become opportunities for