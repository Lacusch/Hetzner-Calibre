# Readme

This repo is used for deploying a Calibre content server (using podman and systemd
service file) with a example libary.

For deployment the required tools are `ansible` `terraforn˙ or `tofu˙

Package installation:

## Mac

### Tofu / Terraform
```zsh
brew install opentofu
```
Or using the terraform package(not recommend, not tested)
```zsh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform  
```

### Ansible
`brew intsall ansible`

### Just 
`brew install just`
## Linux

Intsall things with your package manager or from source

### Windows 

I recommend using WSL then using distro packages or building from source if
needed

## Usage

1. Use the example files as templates for deployment
   ```sh
   cp env_example .env
   cp tfvars.example variables.tf
   ```
2. Add the Hetzner Token for the deplyoment
3. `just`
