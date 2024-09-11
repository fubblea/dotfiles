# NOTE RUN FROM REPO ROOT

# Setup .config
mkdir ${HOME}/.config/

apt update -y

# Install dependencies
apt install curl wget git-all -y

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Setup tmux
apt install tmux -y
ln -s $(pwd)/.tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup zsh
apt install zsh -y
chsh -s $(which zsh)
ln -s $(pwd)/.zshrc ${HOME}/.zshrc

# Setup other utilities

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install nvim
wget https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64/bin/nvim /usr/local/bin/nvim
rm nvim-linux64.tar.gz
ln -s $(pwd)/config/nvim ${HOME}/.config/nvim
