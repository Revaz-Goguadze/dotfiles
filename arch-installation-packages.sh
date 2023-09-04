#!/bin/bash

echo "Installation Will Be Started"
echo "."
sleep 0.2
echo ".."
sleep 0.2
echo "..."
sleep 0.2
echo "...."
sleep 0.2
echo "Started ..."
sleep 0.5

sudo pacman -S --noconfirm --needed base-devel
# List of packages to install using pacman
packages_to_install=(
    polybar lazygit git spectacle vim xarchiver composer picom php julia luarocks fd p7zip zip bzip2 gzip tar unzip unrar zsh vi upower gparted tmux thunar ruby python-pip openvpn neofetch htop vlc dmenu rofi feh libinput intel-ucode mesa base-devel wget i3 i3-gaps ranger coreutils p7zip ripgrep tpm2-tools tpm2-tss ly nodejs npm typescript-language-server bash-language-server python-lsp-server yaml-language-server reflector firefox leafpad ruby-bundler
)

# Install packages using pacman
sudo pacman -S --needed "${packages_to_install[@]}"

# Install Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "Packages and Yay installation completed."

echo "----------------"
echo "----------------"
echo "----------------"

read -p "Do you want add blackarch rep? (Y/N): " choice

if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
    # Add BlackArch repository
    curl -O https://blackarch.org/strap.sh
    chmod +x strap.sh
    sudo ./strap.sh
    rm strap.sh
    # Update package database
    sudo pacman -Syy
    echo "BlackArch repository added."
else
    echo "Only Updating ..."
    sudo pacman -Syy
fi

-- configuring dots


source_file="wallhaven-1p398w_1920x1080.png"
destination_directory="$HOME/Downloads"

# Check if the destination directory exists, and if not, create it
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory"
fi

# Copy the file to the destination directory
cp "$source_file" "$destination_directory/"

cp -r .config $home/
cp -r .font $home/
cp -r .icons $home/

# Ask the user if they want to install fonts
read -p "Do you want to install fonts? (Y/N): " install_fonts_choice

if [ "$install_fonts_choice" == "Y" ] || [ "$install_fonts_choice" == "y" ]; then
    # Run the install-fonts.sh script
    bash ./install-fonts.sh
    echo "Fonts installed."
else
    echo "Skipping font installation."
fi

# Ask the user if they want install opt-apps
read -p "Do you want to install optional apps? (Y/N): " install_opt_choice

if [ "$install_opt_choice" == "Y" ] || [ "$install_opt_choice" == "y" ]; then
    # Run the install-fonts.sh script
    bash ./instll-opt-apps.sh
    echo "Apss installed."
else
    echo "Skipping Apps installation."
fi

echo "Script completed."


