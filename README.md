# Terraform Azure Examples

> Personal experimentation using Terraform to setup infrastructure on Azure.

Note that detailed documentation is provided within the individual example folders themselves.

To view detailed progression over time see the [Changelog](CHANGELOG.md).

## Examples

- [Terraform Local Docker Container](1-terraform-docker-container/)
- [Terraform Azure App Service with Docker - Simple](./2-terraform-azure-app-service-docker/)

## Appendix

### Install Terraform on Linux (WSL)

- Script can be viewed at: [0-scripts/install-terraform](0-scripts/install-terraform)

```bash
#/bin/bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform -install-autocomplete
```

*Note: the install script also installs autocompletion for your default shell (bash and zsh are supported)*

### Azure CLI Authentication

The scripts folder also contains scripts to install necessary Windows Host dependencies: `az-cli` and (optionally) `terraform`.

```powershell
# install az via chocolatey
cinst -y az

# login
az login

# list accounts
az account list

# set subscription via its ID from above
az account set --subscription="SUBSCRIPTION_ID"
```

See: [Azure Provider: Authenticating using Azure CLI](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli) for details.
