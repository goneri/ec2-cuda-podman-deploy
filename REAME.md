# Deploy CUDA in an AWS instance and configure a Podman connection

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
ansible-playbook -vvv deploy.yaml -e @vars.yaml
```

You can test the instance from your machine with:

```
$ podman --connection gpu run --rm --hooks-dir=/usr/share/containers/oci/hooks.d/ docker.io/nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
```

The command will call `nvidia-smi`.

To tear-down the instance:

```
ansible-playbook -vvv deploy.yaml -e @vars.yaml
```
