#!/bin/bash

set -euo pipefail

setup_ubuntu() {
    apt-get update
    apt-get install -y python3 python3-pip python3-venv pipx
    pipx ensurepath
}

setup_fedora() {
    dnf install -y python3 python3-pip pipx
    pipx ensurepath
}

setup_arch() {
    pacman -Sy --noconfirm python python-pip python-pipx
    pipx ensurepath
}

setup_opensuse() {
    zypper refresh
    zypper --non-interactive install python313 python313-pip python313-pipx
    pipx ensurepath
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
    pipx install --include-deps ansible
    pipx ensurepath

    export PATH="$HOME/.local/bin:$PATH"
}

verify_installation() {
    echo "Verifying installation..."
    echo "Python version: $(python3 --version)"
    echo "Pip version: $(python3 -m pip --version)"
    echo "Ansible version: $(ansible --version | head -1)"
    echo "Available collections:"
    ansible-galaxy collection list | head -10
}

run_playbook() {
    echo "Running Ansible playbook..."
    # Install all reqs
    ansible-playbook ./ansible/playbooks/main.yml --extra-vars DOTFILE_INSTALL_ALL=true
}

main() {
    echo "Starting Ansible installation..."
    install_python
    install_ansible
    verify_installation
    echo "Ansible installation completed successfully!"
}

main "$@"