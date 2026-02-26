# 🤖 Armando: My Personal AI Assistant & DevOps Sandbox

[![CI Check](https://github.com/alexconepi-cmd/armando-ai-assistant/actions/workflows/ci.yml/badge.svg)](https://github.com/alexconepi-cmd/armando-ai-assistant/actions/workflows/ci.yml)
[![GitHub last commit](https://img.shields.io/github/last-commit/alexconepi-cmd/armando-ai-assistant)](https://github.com/alexconepi-cmd/armando-ai-assistant/commits/main)
[![GitHub](https://img.shields.io/github/license/alexconepi-cmd/armando-ai-assistant)](https://github.com/alexconepi-cmd/armando-ai-assistant/blob/main/LICENSE)

> **TL;DR:** I built a 24/7 personal AI assistant in 5 days. This project isn't just a simple Telegram bot wrapper; it's my hands-on deep dive into VPS management, Linux security, and AI agent frameworks.

## 🎯 What is Armando?

Armando is a conversational AI agent currently acting as my personal career coach. But more importantly, **it's my live testing ground.** As a Junior Developer transitioning into AI and Automation, I needed a real-world project to break things, fix them, and learn how to deploy systems securely. I built this using an intensive "learning by doing" approach. While I used AI tools (ChatGPT/Gemini) as pair-programmers to navigate unfamiliar Linux configurations, the architecture, debugging, and system integration are the result of my own trial and error.

## 🏗️ The Tech Stack & Architecture

Instead of taking the easy route (like hosting on a simple PaaS), I wanted to understand the infrastructure from the ground up:

* **The Brain:** OpenClaw framework connected to the **DeepSeek API** (giving Armando a massive 200K context window, persistent memory, and basic web fetching).
* **The Interface:** Telegram Bot API, so I can talk to my server from anywhere.
* **The Infrastructure:** A personal VPS running **Ubuntu 22.04 LTS**.
* **The Engine:** `systemd` daemon configured to ensure Armando runs 24/7 with auto-restarts if something crashes.

## 🔒 Security First

One of my main goals was to learn how to secure a server properly before exposing a bot to the internet. I manually configured:
* **UFW (Uncomplicated Firewall):** Blocking everything except essential ports.
* **Fail2Ban:** To protect against brute-force attacks.
* **SSH Hardening:** Disabled password authentication and root login (access strictly via SSH keys).

## 🛣️ Roadmap: What's Next? (The Python Transition)

Currently, the setup and configurations are heavily reliant on **Shell scripts, JSON, and YAML**. 

However, I am currently enrolled in the *Google IT Automation with Python Professional Certificate*. My immediate roadmap for Armando includes:
- [ ] Refactor the JSON/YAML configuration management into clean **Python** code.
- [ ] Add custom Python scripts for log monitoring and self-healing.
- [ ] Expand Armando's capabilities beyond conversation (e.g., executing system tasks via Python).

## 📁 Project Structure

```text
armando-ai-assistant/
├── scripts/           # Automated VPS configuration (Bash)
├── configs/
│   ├── openclaw/      # AI agent configuration (JSON/YAML)
│   ├── systemd/       # Service management
│   └── security/      # Security configurations
├── docs/              # Setup and architecture guides
└── examples/          # Usage examples
```

🖼️ See it in action
<img width="800" alt="Career coaching conversation with Armando" src="https://github.com/user-attachments/assets/d6cb430e-6263-4fbe-a246-e239225cad70" />

(Example of a career coaching conversation with the AI assistant. Check the examples/ folder for more).

Built by Alex Conesa Piñeiro — Always learning, always building.
