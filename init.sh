#!/bin/bash

# Detiene la ejecución si ocurre un error
set -e

# Actualiza la lista de paquetes
echo "Actualizando paquetes..."
sudo apt update

# Instala aplicaciones
echo "Instalando aplicaciones..."
sudo apt install -y bat build-essential yadm curl gnupg lsb-release software-properties-common

# Clona tus dotfiles usando yadm
echo "Clonando dotfiles..."
yadm clone git@github.com:IgnacioNicolasAlvarez/ubuntu-dotfiles.git

# Instala Rust y sus herramientas
echo "Instalando Rust y herramientas relacionadas..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# El script de instalación de Rust requiere que reinicies tu sesión de shell
# para actualizar las variables de entorno. Asegúrate de volver a ejecutar
# este script después de reiniciar tu shell si se detiene aquí.

# Instala herramientas Rust
source $HOME/.cargo/env
cargo install du-dust
cargo install rm-improved
cargo install zoxide --locked
cargo install broot --locked

# Instala Docker
echo "Instalando Docker..."
sudo apt-get remove -y docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Añade la clave GPG oficial de Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Añade el repositorio de Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualiza los paquetes y instala Docker
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Instala Docker Compose
echo "Instalando Docker Compose..."
sudo apt install -y docker-compose

# Instala Brave Browser
echo "Instalando Brave Browser..."
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update
sudo apt install -y brave-browser

# Instala Fish
echo "Instalando Fish..."
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish

echo "Instalación completada con éxito."

