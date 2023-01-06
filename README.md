# Ansible playbook to deploy CUDA in an AWS instance and configure a Podman connection

- prepare the AWS instance (including a VPC and a subnet)
- set-up podman
- install CUDA and all the stuff
- configure the local podman
- upload the wisdom.mar archive

## Usage

To set-up the instance:

```
cp vars.yaml $USER.yaml
vim $USER.yaml
export RHSM_LOGIN="your-RHSM-login"
export RHSM_PASSWORD="your-RHSM-password"
ansible-playbook -vvv deploy.yaml -e @vars.yaml
```

You can test the instance from you local machine's Podman with:

```
$ podman --connection gpu run --rm --hooks-dir=/usr/share/containers/oci/hooks.d/ docker.io/nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```

The command will call `nvidia-smi`.

To tear-down the instance:

```
ansible-playbook -vvv deploy.yaml -e @vars.yaml
```

## Demo

[![demo](https://asciinema.org/a/550039.svg)](https://asciinema.org/a/550039?autoplay=1)
