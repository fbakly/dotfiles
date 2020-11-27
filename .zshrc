# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/fbakly/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias history="history 300"
alias cat="bat"
alias v="nvim"
alias sxiv="devour sxiv"
alias zathura="devour zathura"
alias mpv="devour mpv"
alias blt="bluetoothctl"
alias saxion="cd $HOME/External/Files/Saxion/Year_3/Semester_1/"
alias r="nnn -e"
alias ls="nnn -de"
#alias ls="ls --color=auto"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$PATH:$HOME/.local/bin:$HOME/scripts:"
export EDITOR="nvim"
export TERMINAL="alacritty"
export READER="zathura"
export PAGER="less"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# NNN CONFIG
export NNN_BMS="d:$HOME/Downloads;s:$HOME/External/Files/Saxion/Year_3"
export NNN_BMS="$NNN_BMS;c:$HOME/.config;w:$HOME/Pictures/Wallpapers"
export NNN_BMS="$NNN_BMS;v:$HOME/External/Files/Video"
export NNN_FIFO="/tmp/nnn.fifo nnn"
export NNN_PLUG="w:wallpaper;p:preview-tui;j:autojump;o:fzopen;v:imgview;d:dragdrop"
export NNN_COLORS="3333"
export NNN_FCOLORS="c1e2d72e006033f7c6d6abc4"

export PF_INFO="ascii title os host kernel uptime pkgs memory"
export PF_COL1=3
export PF_COL2=6
export PF_COL3=1

export CM_IGNORE_WINDOW="passmenu"

source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

pfetch

# Enable autojump
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Starship init script. Leave last
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
