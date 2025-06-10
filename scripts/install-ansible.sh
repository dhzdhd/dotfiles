#!/bin/bash

set -euo pipefail

setup_ubuntu() {
    apt-get update
    apt-get install -y python3 python3-pip python3-venv
}

setup_fedora() {
    dnf install -y python3 python3-pip
}

setup_arch() {
    pacman -Sy --noconfirm python python-pip
}

setup_opensuse() {
    zypper --non-interactive install python3 python3-pip
}

install_python() {
    echo "Installing Python"

    if command -v apt-get >/dev/null 2>&1; then
        setup_ubuntu
    elif command -v dnf >/dev/null 2>&1; then
        setup_fedora
    elif command -v pacman >/dev/null 2>&1; then
        setup_arch
    elif command -v zypper >/dev/null 2>&1; then
        setup_opensuse
    else
        echo "Unsupported distribution"
        cat /etc/os-release 2>/dev/null || echo "Cannot determine OS"
        exit 1
    fi
}

install_ansible() {
    echo "Installing Ansible..."
    python3 -m pip install --upgrade pip setuptools wheel
    python3 -m pip install ansible ansible-core
    
    echo "Installing Ansible collections..."
    ansible-galaxy collection install community.general ansible.posix
}

verify_installation() {
    echo "Verifying installation..."
    echo "Python version: $(python3 --version)"
    echo "Pip version: $(python3 -m pip --version)"
    echo "Ansible version: $(ansible --version | head -1)"
    echo "Available collections:"
    ansible-galaxy collection list | head -10
}

# Main execution
main() {
    echo "Starting Ansible installation..."
    install_python
    install_ansible
    verify_installation
    echo "Ansible installation completed successfully!"
}

main "$@"