#!/bin/bash

# This installs alacritty terminal on ubuntu (https://github.com/jwilm/alacritty)
# You have to have rust/cargo installed for this to work

# Install required tools
sudo apt-get install -y cmake libfreetype6-dev libfontconfig1-dev xclip

# Download, compile and install Alacritty
git clone https://github.com/jwilm/alacritty ~/Descargas/
cd alacritty
cargo build --release

# Add Man-Page entries
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

# Add shell completion for bash and zsh
mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

sudo mkdir -p /usr/share/zsh/functions/Completion/X/
sudo cp extra/completions/_alacritty /usr/share/zsh/functions/Completion/X/_alacritty

# Copy default config into home dir
cp alacritty.yml ~/.alacritty.yml

# Create desktop file
mkdir -p ~/.local/share/applications/
cp extra/linux/Alacritty.desktop ~/.local/share/applications/

# Copy binary to path
sudo cp target/release/alacritty /usr/local/bin

# Remove temporary dir
cd ..
rm -rf alacritty
