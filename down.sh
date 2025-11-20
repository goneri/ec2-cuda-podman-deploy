#!/bin/bash

source venv/bin/activate
test -d aws-automation || git clone https://gitlab.cee.redhat.com/compute/aws-automation
python3 ./aws-automation/aws-saml.py --target-account 354468940538 --target-role 354468940538-poweruser

export AWS_PROFILE=saml
export AWS_REGION=ca-central-1

ansible-playbook purge.yaml -e @$USER.yaml
