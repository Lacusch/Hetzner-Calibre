# TODO

- [ ] Set up services one by one (starting with Ansible Terraform provider and a small script for calibre)
- [ ] Set up secrets for deployment somewhere
  - [ ] Get secrest from Hashicorp secret Vault?
  - [ ] Bitwarden?
- [ ] Setup backup and sync for the services (S3?)
- [ ] Use tofu workspaces to manage different parts of the setup
  - [ ] Setup a domain with Cloudflare using the Primary IPV6 IP that can be created and destroyed independantly from the server on a different workspace
