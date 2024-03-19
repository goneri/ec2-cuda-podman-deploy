# Ansible playbook to deploy CUDA in an AWS instance and Ollama

- prepare the AWS instance (including a VPC and a subnet)
- install CUDA and all the stuff
- install Ollama

## Usage

To set-up the instance:

```
cp vars.yaml $USER.yaml
vim $USER.yaml
ansible-playbook -vvv deploy.yaml -e @vars.yaml
```
