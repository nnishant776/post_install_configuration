#!/usr/bin/env sh

# Install the ansible application
python3 -m pip install ansible gio

# Install the required 3rd party ansible modules
ansible-galaxy collection install community.general

# Run the playbook
ansible-playbook -K main.yaml --extra-vars @config.yaml
