# Terraform Docker Container

This example uses Terraform to build a docker container running `nginx` locally.

## main.tf

```terraform
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}

```

## start.sh

A bash/shell script to run all configurations, build the container, and run it on port 8000.

```bash
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
```

Destroy the container via `terraform destroy -auto-approve`.

