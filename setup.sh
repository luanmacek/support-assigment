#!/bin/bash

set -e

echo "Checking Ansible..."

if ! command -v ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."

    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install ansible
    else
        sudo apt update
        sudo apt install -y ansible
    fi
fi

echo "Installing required collections..."
ansible-galaxy collection install -r requirements.yml

echo "Running playbook..."
ansible-playbook playbook.yml --ask-become-pass