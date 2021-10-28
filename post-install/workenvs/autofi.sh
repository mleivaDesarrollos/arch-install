
# ROBO3T - Mongo DB Database explorer
cd ~/.aur-packages/
git clone https://aur.archlinux.org/robo3t-bin && cd robo3t-bin && makepkg -si --noconfirm

# MongoDB-bin - For cli needed commands
cd ~/.aur-packages/
git clone https://aur.archlinux.org/mongodb-bin && cd mongodb-bin && makepkg -si --noconfirm

# MongoDB-bin - For cli needed commands
cd ~/.aur-packages/
git clone https://aur.archlinux.org/mongodb-tools-bin && cd mongodb-tools-bin && makepkg -si --noconfirm

# NVM - Node version Manager
cd ~/.aur-packages/
git clone https://aur.archlinux.org/nvm && cd nvm && makepkg -si --noconfirm

## NVM for immediate use
source /usr/share/nvm/init-nvm.sh
## NVM for future use with zsh
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
## NVM default install
nvm install v12.14.0
nvm alias default 12.14.0

# Docker, Docker-compose Nix - for orca 2 use
sudo pacman -Sy nix docker docker-compose
## Enable nix daemon
sudo systemctl enable nix-daemon.service
## Set permission to current user
usermod -aG nix-users zaktorius
usermod -aG docker zaktorius
echo 'You need to reboot in order to get NIX and DOCKER in work';

# Direnv - to complement nix
cd ~/.aur-packages/
git clone https://aur.archlinux.org/direnv && cd direnv && makepkg -si --noconfirm

# Zoom - For meetings with the team
cd ~/.aur-packages/
git clone https://aur.archlinux.org/zoom && cd zoom && makepkg -si --noconfirm

