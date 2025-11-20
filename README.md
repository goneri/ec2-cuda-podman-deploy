# Ansible playbook to deploy CUDA in an AWS instance and Ollama

- prepare the AWS instance (including a VPC and a subnet)
- install CUDA and all the stuff
- install Ollama

## Usage

To set-up the instance:

```
cp vars.yaml $USER.yaml
vim $USER.yaml
./up.sh
```

If `add_host_in_ssh_config` is true, you can directly connect with:

```
ssh -F ~/.ssh/${USER}_aap.lab_host_config aap.lab
```

Once you're done:

```
./down.sh
```
