#!/bin/bash
set -eux


source venv/bin/activate
test -d aws-automation || git clone https://gitlab.cee.redhat.com/compute/aws-automation
python3 ./aws-automation/aws-saml.py --target-account 354468940538 --target-role 354468940538-poweruser

export AWS_PROFILE=saml
export AWS_REGION=ca-central-1

pip install -r requirements.txt
ansible-galaxy collection install --requirements-file requirements.yml --collections-path collections
ansible-galaxy role install -r requirements.yml --roles-path roles
pip install -r requirements.txt
find collections/ansible_collections/ -maxdepth 3 -name requirements.txt -exec pip install -r {} \;

test -f $USER.yaml || cp -v defaults.yaml $USER.yaml
ansible-playbook deploy.yaml -e @$USER.yaml
