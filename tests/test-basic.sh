#!/bin/bash

# Basic test script for Armando AI Assistant repository
# This script verifies the repository structure and basic functionality

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Running Basic Tests ===${NC}"
echo ""

# Test 1: Check required files
echo -e "${YELLOW}[Test 1] Checking required files...${NC}"
required_files=(
    "README.md"
    "LICENSE"
    "CHANGELOG.md"
    ".gitignore"
    "scripts/setup-vps.sh"
    "configs/openclaw/config.yaml.example"
    "configs/security/ssh_config.example"
    "configs/security/ufw_rules.example"
    "configs/security/fail2ban.local.example"
    "configs/systemd/openclaw-agent.service.example"
    "docs/architecture.md"
    "docs/setup-guide.md"
    "examples/basic-usage.md"
)

all_passed=true
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (MISSING)"
        all_passed=false
    fi
done

# Test 2: Check file permissions
echo ""
echo -e "${YELLOW}[Test 2] Checking file permissions...${NC}"
if [ -x "scripts/setup-vps.sh" ]; then
    echo -e "  ${GREEN}✓${NC} scripts/setup-vps.sh is executable"
else
    echo -e "  ${RED}✗${NC} scripts/setup-vps.sh is not executable"
    all_passed=false
fi

# Test 3: Check for sensitive data patterns
echo ""
echo -e "${YELLOW}[Test 3] Checking for sensitive data patterns...${NC}"
sensitive_patterns=(
    "password"
    "secret"
    "token"
    "key"
    "api[_-]key"
    "bot[_-]token"
)

found_sensitive=false
for pattern in "${sensitive_patterns[@]}"; do
    if grep -r -i "$pattern" --include="*.md" --include="*.sh" --include="*.yaml" --include="*.example" . 2>/dev/null | grep -v "your_" | grep -v "example" | grep -v "placeholder" > /dev/null; then
        echo -e "  ${RED}✗${NC} Found potential sensitive data pattern: $pattern"
        found_sensitive=true
    fi
done

if [ "$found_sensitive" = false ]; then
    echo -e "  ${GREEN}✓${NC} No sensitive data patterns found"
fi

# Test 4: Check markdown formatting
echo ""
echo -e "${YELLOW}[Test 4] Checking markdown files...${NC}"
md_files=$(find . -name "*.md" -type f | wc -l)
echo -e "  ${GREEN}✓${NC} Found $md_files markdown files"

# Test 5: Check repository size
echo ""
echo -e "${YELLOW}[Test 5] Checking repository size...${NC}"
repo_size=$(du -sh . | cut -f1)
echo -e "  ${GREEN}✓${NC} Repository size: $repo_size"

# Summary
echo ""
echo -e "${GREEN}=== Test Summary ===${NC}"
if [ "$all_passed" = true ] && [ "$found_sensitive" = false ]; then
    echo -e "${GREEN}All tests passed!${NC}"
    echo "Repository structure is correct and ready for use."
    exit 0
else
    echo -e "${RED}Some tests failed.${NC}"
    echo "Please review the failed tests above."
    exit 1
fi
