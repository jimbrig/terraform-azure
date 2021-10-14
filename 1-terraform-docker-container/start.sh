#!/bin/bash

# initialize
terraform init

# (optional) Create a plan file
terraform plan -out=plan.tf

# Apply (auto approved for scripting)
terraform apply -auto-approve

# check docker container is running
docker ps

# set an alias for your default browser in windows
alias firefox="/mnt/c/Program\ Files/Firefox\ Developer\ Edition/firefox.exe"

# launch browser to localhost:8000 to verify container running
firefox localhost:8000
