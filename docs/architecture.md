
Architecture Overview

====================

System Components

1. VPS Infrastructure: Ubuntu Server, UFW firewall, Fail2Ban
2. OpenClaw Agent: Core AI agent framework
3. DeepSeek API: AI model provider (200K context window)
4. Telegram Bot: User interface and communication layer
5. Workspace: Persistent memory and file storage

Data Flow

1. User → Telegram Message → Bot API
2. Bot API → OpenClaw Agent → Context Processing
3. OpenClaw → DeepSeek API → AI Response Generation
4. DeepSeek → OpenClaw → Response Formatting
5. OpenClaw → Telegram Bot → User Response

Security Layers

• Network: UFW firewall (SSH only)
• Access: SSH key authentication only
• Application: Fail2Ban for intrusion prevention
• Service: Dedicated user with limited privileges
