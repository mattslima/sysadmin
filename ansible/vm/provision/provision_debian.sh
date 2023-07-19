#!/bin/bash
sudo apt update &&
sudo apt install -y ansible sshpass

if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi
  
# Copiar a chave pública da máquina1 para as demais máquinas
sshpass -p "vagrant" ssh-copy-id -o StrictHostKeyChecking=no vagrant@192.168.10.11