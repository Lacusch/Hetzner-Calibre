set dotenv-load := true

default: init apply deploy print-access

init: 
    tofu init
destroy:
    tofu destroy
test-install:
    ansible-playbook -i ansible/hosts.txt ansible/install.yml --ask-pass --ask-become-pass
plan:
    tofu plan

apply:
    tofu apply

redo: destroy apply key-reset deploy

deploy: host
    ansible-playbook -i ansible/hosts.txt ansible/calibre-server.yml

# Between deployments the host's identifier for ssh will change

# This command restets if after a deployemnt
key-reset:
    ssh-keygen -R $(tofu output --raw server_ip)
    ssh-keyscan -H $(tofu output --raw server_ip)>> ~/.ssh/known_hosts && ssh root@$(tofu output --raw server_ip) echo "✅ SSH connection works"

host:
    @echo "[calibre_server]" > ansible/hosts.txt
    @echo "$(tofu output --raw server_ip)" >> ansible/hosts.txt
    @echo "✅ hosts.txt recreated with current IP"

print-access:
    @echo "SSH access: root@$(tofu output --raw server_ip)"
    @printf "\033]8;;http://$(tofu output --raw server_ip)\033\\Calibre Content Server link \033]8;;\033\\\\\n"
    @echo "Same IP as the server itself on port 80"
    @echo "Should work in these terminals, including Iterm, Ghostty, etc."
    @echo "Full list: (https://github.com/Alhadis/OSC8-Adoption/#terminal-emulators)"
ansible-vm:
    #!/usr/bin/env -S bash -euo pipefail
    set -euo pipefail
    virt-install --name AlmaLinux-9 \
    --description 'Alma Linux 9' \
    --ram 4096 \
    --vcpus 4 \
    --osinfo almalinux9 \
    --network bridge=virbr0 \
    --cdrom ~/.local/share/libvirt/images/ISOS/AlmaLinux-9.6-x86_64-dvd.iso \
    --noautoconsole --destroy-on-exit
#    --graphics vnc,listen=127.0.0.1,port=5901
