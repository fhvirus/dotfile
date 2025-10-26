# ZSH config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="philips"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# FZF config
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info \
	--color='fg:#D8DEE9,bg:#2E3440,hl:#81A1C1'\
	--color='fg+:#D8DEE9,bg+:#3B4252,hl+:#81A1C1'\
	--color='info:#616E88,border:#3B4252,prompt:#81A1C1'\
	--color='pointer:#EBCB8B,marker:#D08770,spinner:#81A1C1,header:#616E88'"

# Some options
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.local/share/bob/nvim-bin
export PATH=$PATH:~/.cargo/bin

export BAT_THEME="Nord"
export PYTHONPYCACHEPREFIX="$HOME/.cache/pycache"

# Command Alias
alias open="xdg-open"
alias c='g++ -Wall -Wconversion -Wextra -Wfatal-errors -g -std=c++17 -fsanitize=undefined,address -DOWO -DTOKI -o run'

# from https://github.com/nvm-sh/nvm/issues/2724#issuecomment-1336537635
# lazy_load_nvm() {
#   unset -f npm node nvm
#   export NVM_DIR=~/.nvm
#   [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
# }
# npm()  { lazy_load_nvm; npm $@ }
# node() { lazy_load_nvm; node $@ }
# nvm()  { lazy_load_nvm; nvm $@ }

# [ -f "/home/lemon/.ghcup/env" ] && source "/home/lemon/.ghcup/env" # ghcup-env
# [[ ! -r '/home/euom/.opam/opam-init/init.zsh' ]] || source '/home/euom/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
