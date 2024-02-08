#!/bin/bash

# Mise à jour des packages
sudo apt update

# Installation des dépendances
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Ajout de la clé GPG pour Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajout du dépôt Docker dans sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des packages après l'ajout du dépôt Docker
sudo apt update

# Installation de Docker CE
sudo apt install -y docker-ce

# Vérification du statut de Docker
sudo systemctl status docker

# Lancement du conteneur Docker pour Kuma Uptime
sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1

# Notification de l'installation terminée
echo "Kuma Uptime a été installé avec succès."
