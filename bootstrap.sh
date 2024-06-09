# NOTE RUN FROM REPO ROOT

# Setup .config
ln -s $(pwd)/config/* ${HOME}/.config/

apt update -y

# Setup tmux
apt install tmux -y
ln -s $(pwd)/.tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh
apt install zsh -y
chsh -s $(which zsh)
ln -s $(pwd)/.zshrc ${HOME}/.zshrc

# Setup other utilities
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

apt install zoxide

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
