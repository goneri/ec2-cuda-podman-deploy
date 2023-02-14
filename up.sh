#!/bin/bash
set -eux
ansible-galaxy collection install --requirements-file requirements.yml --collections-path collections
ansible-playbook deploy.yaml -e @$USER.yaml
ansible-playbook extra.yaml -i gpu, -e @$USER.yaml
