# NOTE RUN FROM REPO ROOT

# Setup .config
ln -s $(pwd)/config/* ${HOME}/.config/

# Setup tmux
ln -s $(pwd)/.tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh
curl -L git.io/antigen > ${HOME}/antigen.zsh
ln -s $(pwd)/.zshrc ${HOME}/.zshrc

sudo apt update -y

# Setup other utilities
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo apt install zoxide

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
