# ZSH config
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="philips"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info \
	--color='fg:#D8DEE9,bg:#2E3440,hl:#81A1C1'\
	--color='fg+:#D8DEE9,bg+:#3B4252,hl+:#81A1C1'\
	--color='info:#616E88,border:#3B4252,prompt:#81A1C1'\
	--color='pointer:#EBCB8B,marker:#D08770,spinner:#81A1C1,header:#616E88'"

# Some options
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BAT_THEME="Nord"
export PATH=$PATH:~/.local/bin
export TPS_TASK_TEMPLATES_PATH=$HOME/.local/share/tps/task-templates

# Command Alias
alias fd="fdfind"
alias reload="source ~/.zshrc"
alias bat="batcat"
alias c='g++ -Wall -Wconversion -Wfatal-errors -g -std=c++17 -fsanitize=undefined,address -DNONTOI'
alias owo="vim ~/code/owo/eek.cpp"
alias csievpn='sudo openvpn ~/Documents/school/NTU/newconfig25.ovpn'
alias readqr='while :; do import -silent -window root bmp:- | zbarimg - 2>/dev/null; sleep 1; done'

##################################################################
# Below are the original zsh after installing oh-my-zsh and fzf. #
##################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="philips"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

######################
# BEGIN SUDOLPHINING #
######################

define(){
    o=''
    while IFS="
" read -r a
    do o="${o}${a}"'
'
    done;
    eval "$1=\$o";
}

define dolphin_left <<'EOF'
                                                           __
                              .__                         / |
                             /  /                         |  \
                            /   |                     _-------'_
                       ____/     \_________      __--"      _/  \_
         _______------"                    "----"          _-\___/
     _--"                                               _-"
 ___<___                                          ___--"
(-------0                                   __---"
 `--___                                    /
       "--___\                _______-----"
             \\    (____-----"
              \\    \_
               `.`..__\
EOF

define dolphin_right <<'EOF'
                                                    ,adBBB8B88B8888b,
                            ,d8888ba,,,,,,,adBBBB8B888888888888888BB#,
                         d8888888888888888BBB8888888888888888(O;8B###RRR88b,
                            `VB888888888888888888888888888888888888PY8888P'
                              VWWB88888BB88B8B8888888888888888888P'
                             dWWBBBBBBBBB8BB8B888888888888888P'
                         ,dBBBBBBBBBBBBB8B88888888888888888P'
                      ,dBBBBBBBBBBBB888888888888P'  d8888P
                   ,dBBBBBBBBBBB8888888888P'     ,d8888P'
               ,adBBBBBBBBB888888888P'         d888P'
            ,dBBBBBBBBBB888888P'
         ,dBBBBBBBBBB888P'
;.aaad88bad8BBBBBBBBP'
 V88888888BBBP'
  Y888888P
  8888888
  I8888P
  888P
 88P
 V
EOF

sudo () {
    output=$(/usr/bin/env sudo $@)

    echo "${dolphin_left}" 1>&2
    echo "${output}"
    echo "${dolphin_right}" 1>&2
}

undolphin () {
    unset dolphin_left
    unset dolphin_right
    unset -f define;
    unset -f sudo;
    unset -f undolphin;
}

