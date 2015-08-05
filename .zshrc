autoload -U compinit promptinit colors
compinit
promptinit
colors

# Left promt
PROMPT="
%{$fg[red]%} >  %{$reset_color%}"
# Right promt
RPROMPT="%B%{$fg[black]%}%~%{$reset_color%}%b"

# Disable beeping (I hate this hell sound!)
setopt NO_BEEP

setopt AUTO_CD
setopt CORRECT

export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

export EDITOR="vim"

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
alias vgo='vim -u ~/.vimrc.go'

# Rust plugin for VIM need this path to Racer utility
export RUST_SRC_PATH=$HOME/projects/rust/src

# Sudo alias
alias svim='sudoedit'
alias pacman='sudo pacman'

# Ls alias
alias ll='ls -alhF'
alias la='ls -Ah'
alias lla='ls -lAh'

# Enable color support of ls and also handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Add in PATH my script directory
pathdirs=(
    ~/scripts
)

for dir in $pathdirs; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done
