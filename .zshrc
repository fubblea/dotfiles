source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Other plugins
antigen bundle tmux
antigen bundle zoxide

# Zoxide setup
eval "$(zoxide init zsh)"

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme gnzh

# Tell Antigen that you're done.
antigen apply

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias lg="lazygit"
alias pip="uv pip"
export PATH="$PATH:/opt/nvim-linux64/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
