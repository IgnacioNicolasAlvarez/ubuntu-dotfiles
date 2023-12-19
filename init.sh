#!/bin/bash

# Detiene la ejecución si ocurre un error
set -e

# Actualiza la lista de paquetes
echo "Actualizando paquetes..."
sudo apt update

# Instala aplicaciones
echo "Instalando aplicaciones..."
sudo apt install -y bat build-essential yadm

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

echo "Instalación completada con éxito."
