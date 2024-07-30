#!/bin/bash
set -eux
ansible-galaxy collection install --requirements-file requirements.yml --collections-path collections
ansible-galaxy role install -r requirements.yml --roles-path roles
pip install -r requirements.txt
find collections/ansible_collections/ -maxdepth 3 -name requirements.txt -exec pip install -r {} \;
ansible-playbook deploy.yaml -e @$USER.yaml
