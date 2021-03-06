alias gah='sudo $(fc -ln -1)'
alias vime="vim ~/.vimrc"
alias o="xdg-open"
alias gc="git commit -v -s"
alias gst="git status --short"
alias ga="git add"
alias gd="git diff --minimal"
alias gl="git log --oneline --decorate --graph"
alias ls="ls --color"
alias vim="vim"

function socks {
    pkill ssh
    ssh -D 8008 emerald -fN
}

function up {
	~/bin/icyup.sh "$1"
}

function nvmon {
	source ~/.nvm/nvm.sh
}

function envac {
	source .env/bin/activate
}

function vpn {
	~/bin/vpnon.sh
}

function dt() {
    time.sh -n
}

function bat() {
    bat.sh -n
}
