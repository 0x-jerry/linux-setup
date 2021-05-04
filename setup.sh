apt update
apt install git vim -y

# 创建要作为swap分区的文件:增加1GB大小的交换分区，则命令写法如下，其中的count等于想要的块的数量（bs*count=文件大小）。
dd if=/dev/zero of=/root/swapfile bs=1M count=2048
# 建立swap的文件系统
mkswap /root/swapfile
# 启用swap文件
swapon /root/swapfile
# echo '\n/root/swapfile swap swap defaults 0 0\n' > /etc/fstab

# install docker
wget -O - https://get.docker.com | sh

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


#install ufw
apt install ufw
ufw allow 22/tcp
ufw allow 80
ufw allow 443
ufw default deny incoming
systemctl restart ufw.service
ufw enable

# install oh-my-zsh
# plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
apt install zsh curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
