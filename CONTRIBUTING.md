# Contributing to Armando AI Assistant

Thank you for your interest in contributing to Armando AI Assistant! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md).

## How Can I Contribute?

### Reporting Bugs
- Check if the bug has already been reported in [Issues](https://github.com/<your-username>/armando-ai-assistant/issues)
- Use the bug report template when creating a new issue
- Include detailed steps to reproduce the bug
- Include system information and error messages

### Suggesting Enhancements
- Check if the enhancement has already been suggested
- Use the feature request template
- Explain why this enhancement would be useful
- Include examples or mockups if applicable

### Pull Requests
1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Add or update tests as needed
5. Update documentation
6. Commit your changes (`git commit -m 'Add some amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

## Development Setup

### Prerequisites
- Ubuntu 22.04+ or similar Linux distribution
- Git
- Python 3.8+
- Node.js (for OpenClaw development)

### Local Development
1. Clone your fork:
   ```bash
   git clone https://github.com/<your-username>/armando-ai-assistant.git
   cd armando-ai-assistant
   ```

2. Set up development environment:
   ```bash
   # Install development dependencies
   pip install -r requirements-dev.txt  # If applicable
   
   # Set up pre-commit hooks
   pre-commit install
   ```

## Coding Standards

### Shell Scripts
- Use ShellCheck for linting
- Follow Google Shell Style Guide
- Add shebang (`#!/bin/bash`)
- Include error handling (`set -e`)

### Documentation
- Use Markdown for documentation
- Follow consistent formatting
- Include code examples where helpful
- Keep documentation up to date with code changes

### Commit Messages
Follow [Conventional Commits](https://www.conventionalcommits.org/):
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks

Example: `feat: add Docker support for easier deployment`

## Testing

### Running Tests
```bash
# Run shell script tests
./tests/test-setup.sh

# Run documentation tests
markdownlint "**/*.md"
```

### Adding Tests
- Add tests for new features
- Update tests when fixing bugs
- Ensure tests pass before submitting PR

## Documentation

### Updating Documentation
- Update README.md for significant changes
- Update CHANGELOG.md for all releases
- Add or update relevant documentation in `docs/`
- Include examples in `examples/`

### Documentation Standards
- Use clear, concise language
- Include code examples
- Link to relevant resources
- Keep documentation organized

## Review Process

1. All contributions require review
2. Address review comments promptly
3. Ensure CI tests pass
4. Update documentation as needed
5. Squash commits if requested

## Questions?

- Open an issue for questions about contributing
- Check existing documentation first
- Be respectful and patient with maintainers

Thank you for contributing to Armando AI Assistant!
