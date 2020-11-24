alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"
alias i3cf="nvim ~/.config/i3/config"
alias config="nvim ~/.config"
alias ceekyoo="cd /home/rosh/Dev/django/CeekYoo"
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias copy="xclip -selection clipboard -i"
alias gitc="git clone"
alias vpn="sudo protonvpn connect -f"
alias ports="sudo lsof -i -P -n | grep LISTEN"
alias batt="cat /sys/class/power_supply/BAT0/capacity"
alias wgets="wget --quiet --show-progress"
alias tt="mupdf /home/rosh/Documents/college/Time_table.pdf"
alias mc='mpv "/home/rosh/Music/$(ls /home/rosh/Music/ | fzf --preview="tree -L 1 {}" )"'
alias yt='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias zz='devour zathura'
alias lofi='devour /home/rosh/Desktop/lofi'
alias scan='sudo arp-scan 192.168.1.0/24 --interface=wlo1'
alias todo='nvim ~/todo.md'

# Path to your oh-my-zsh installation.
export ZSH="/home/rosh/.oh-my-zsh"
export PATH=$PATH:/root/.gem/ruby/2.7.0/bin
export EDITOR=nvim
export BROWSER=firefox
export PATH=$PATH:/home/rosh/.cargo/bin
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export _JAVA_OPTIONS='-Dswing.aatext=true'
export _JAVA_AWT_WM_NONREPARENTING=1

#Theme
ZSH_THEME="robbyrussell"

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

zle -N cd_with_fzf cd_with_fzf

#Key bindings
bindkey ^f cd_with_fzf

#Fzf specific things
pacs() {
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

pacr() {
    sudo pacman -R $(pacman -Q | fzf --multi --preview 'pacman -Si {1}'| cut -d ' ' -f 1)
}
cd_with_fzf() {

    cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" )"

}

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

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

export LC_CTYPE="en_IN.utf8"
set encoding="utf-8"

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
