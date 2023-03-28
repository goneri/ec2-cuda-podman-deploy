#!/bin/bash
set -eux
ansible-galaxy collection install --requirements-file requirements.yml --collections-path collections
pip install -r requirements.txt
find collections/ansible_collections/ -maxdepth 3 -name requirements.txt -exec pip install -r {} \;
ansible-playbook deploy.yaml -e @$USER.yaml
ansible-playbook extra.yaml -i gpu, -e @$USER.yaml
