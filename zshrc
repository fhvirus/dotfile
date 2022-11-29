# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/lemon/.oh-my-zsh"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/usr/local/texlive/2022/bin/x86_64-linux:$PATH
export PATH=$HOME/.config/rofi/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="philips"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias owo="vim ~/OWO/eek.cpp"
alias uwu="vim ~/OWO/jizz.cpp"
alias cwc="vim ~/OWO/cwc.c"
alias reload="clear && . ~/.zshrc"
alias eek="toilet -f future --gay \"[Knapsack DP is harder than FFT.]\" -w 95"
alias jizz="toilet -f future --gay \"[Knapsack DP is NP-Hard, but FFT is O(N log N).]\" -w 135"
alias clock="tock -c -m -s"
alias fd="fdfind"
alias c='g++ -Wall -Wconversion -Wfatal-errors -g -std=c++17 -fsanitize=undefined,address'
alias csievpn='sudo openvpn ~/school/NTU/newconfig25.ovpn'
neofetch

source $HOME/.fzf.zsh
