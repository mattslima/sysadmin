#!/bin/bash
sudo apt update
sudo apt install -y ansible sshpass
sudo mkdir /etc/ansible
sudo bash -c 'cat <<EOF > /etc/ansible/hosts
192.168.10.10
EOF'
sudo bash -c 'cat <<EOF > /etc/ansible/ansible.cfg
[defaults]
inventory = /etc/ansible/hosts
remote_user = vagrant
ask_pass = false
host_key_checking = false
EOF'

# Comandos de provisionamento adicionais aqui
# Criar um par de chaves SSH na máquina1 (se ainda não existir)
if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# Copiar a chave pública da máquina1 para as demais máquinas
sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.10.10
