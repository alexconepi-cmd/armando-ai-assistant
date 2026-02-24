# Setup Guide - Armando AI Assistant
## =================================

## Prerequisites
- Ubuntu 22.04/24.04 VPS (2GB RAM, 20GB SSD minimum)
- SSH access with key authentication
- Basic Linux command line knowledge

## Quick Start
1. Clone this repository:

   ```bash
   git clone https://github.com/YOUR_USERNAME/armando-ai-assistant.git
   cd armando-ai-assistant
   ```
2. Review and customize configuration files in configs/

3. Run the setup script (review before running!):
   ```
   chmod +x scripts/setup-vps.sh
   ./scripts/setup-vps.sh
   ```
4. Set environment variables:
   ```
   export TELEGRAM_BOT_TOKEN="your_bot_token"
   export DEEPSEEK_API_KEY="your_api_key"

   ```

5. Follow the detailed setup instructions in README.md

Security Notes

⚠️ IMPORTANT: Never commit API keys or secrets to Git!

• Use environment variables
• Review all scripts before running
• Test in isolated environment first
