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

# If Ollama is already running locally, you need to turn it off
sudo systemctl stop ollama
# To stop ollama on Mac, use the ollama entry on the menu bar to Quit Ollama

# And finally, you can redirect locally the port 11434 from your remove instance
ssh -L 11434:127.0.0.1:11434 ec2-user@35.182.110.44

# In another terminal you can now use ollama locally
ollama run mistral
```

## Run jupyter notebook over created ec2-instance

```
# To update the currently installed ec2-instance packages
sudo dnf update

# Install python3.x, should be >=3.8.1 to support python langchain module
sudo dnf install python3.x

# Install python virtual env
python3.11 -m venv .env
source .env/bin/activate

# Install python pip
sudo dnf install python3-pip
pip install --upgrade pip

# Install required library
pip3 install torch
pip3 install jupyter-lab
pip3 install jupyter
jupyter notebook --generate-config

jupyter-lab --ip 0.0.0.0 --no-browser --allow-root
# Jupyter notebook should start running, with the token

# Start jupyter notebook in browser
- In the browser url-> "ec2_instance_public_ip:8888"
- Enter the token obtained from the previous step, to login to jupyter notebook instance
- Jupyter notebook should be running as expected
```