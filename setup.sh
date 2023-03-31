#!/bin/sh
apt update
apt install git vim htop -y

# install docker
# https://github.com/docker/docker-install
wget -O - https://get.docker.com | sh

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/latest/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# install fail2ban
apt install fail2ban

# install ufw
apt install ufw
ufw allow 22/tcp
ufw allow 80
ufw allow 443
ufw default deny incoming
systemctl restart ufw.service
ufw --force enable

# install oh-my-zsh
apt install zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install omz plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
chsh -s $(which zsh) # change default shell

omz plugin enable zsh-autosuggestions 
omz plugin enable zsh-syntax-highlighting
