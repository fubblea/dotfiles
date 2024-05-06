# NOTE RUN FROM REPO ROOT

# Setup .config
ln -s $(pwd)/config/* ${HOME}/.config/

# Setup tmux
ln -s $(pwd)/.tmux.conf ${HOME}/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
