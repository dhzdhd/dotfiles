#!/bin/bash

set -euo pipefail

echo "🔍 Detecting operating system..."

# Function to install Python and pip
install_python() {
    if command -v apt-get >/dev/null 2>&1; then
        echo "📦 Installing Python on Ubuntu/Debian..."
        apt-get update
        apt-get install -y python3 python3-pip python3-venv
    elif command -v dnf >/dev/null 2>&1; then
        echo "📦 Installing Python on Fedora/RHEL..."
        dnf install -y python3 python3-pip
    elif command -v pacman >/dev/null 2>&1; then
        echo "📦 Installing Python on Arch Linux..."
        pacman -Sy --noconfirm python python-pip
    elif command -v zypper >/dev/null 2>&1; then
        echo "📦 Installing Python on openSUSE..."
        zypper --non-interactive install python3 python3-pip
    elif command -v apk >/dev/null 2>&1; then
        echo "📦 Installing Python on Alpine..."
        apk add --no-cache python3 py3-pip
    else
        echo "❌ Unsupported distribution"
        cat /etc/os-release 2>/dev/null || echo "Cannot determine OS"
        exit 1
    fi
}

# Function to install Ansible
install_ansible() {
    echo "🚀 Installing Ansible..."
    python3 -m pip install --upgrade pip setuptools wheel
    python3 -m pip install ansible ansible-core
    
    echo "📋 Installing Ansible collections..."
    ansible-galaxy collection install community.general ansible.posix
}

# Function to verify installation
verify_installation() {
    echo "✅ Verifying installation..."
    echo "Python version: $(python3 --version)"
    echo "Pip version: $(python3 -m pip --version)"
    echo "Ansible version: $(ansible --version | head -1)"
    echo "Available collections:"
    ansible-galaxy collection list | head -10
}

# Main execution
main() {
    echo "🎯 Starting Ansible installation..."
    install_python
    install_ansible
    verify_installation
    echo "🎉 Ansible installation completed successfully!"
}

main "$@"