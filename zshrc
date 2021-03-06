# use Antigen to manager oh-my-zsh plugins
source $HOME/dotfiles/antigen.zsh

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# oh-my-zsh path
export ZSH=$HOME/dotfiles/.oh-my-zsh
export TERM='xterm-256color'

# Set name of the theme to load.
ZSH_THEME="lambda-mod-zsh-theme/lambda-mod"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	tmux
)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

source ~/dotfiles/my-alias.zsh

# alias
alias diff=colordiff

function proxy() {
	export http_proxy=http://dev-proxy.oa.com:8080
	export https_proxy=http://dev-proxy.oa.com:8080
	export HTTP_PROXY=http://dev-proxy.oa.com:8080
	export HTTPS_PROXY=http://dev-proxy.oa.com:8080
	export no_proxy="localhost,127.0.0.1,.oa.com"
	echo "Proxy on http://dev-proxy.oa.com:8080"
}

function noproxy() {
	export http_proxy=
	export https_proxy=
	export HTTP_PROXY=
	export HTTPS_PROXY=
	echo "Proxy off"
}

# git proxy
gproxy () {
	git config --global http.proxy http://dev-proxy.oa.com:8080
	echo "Git HTTP Proxy on: http://dev-proxy.oa.com:8080"
}

# git noproxy
gnoproxy () {
	git config --global --unset http.proxy
	echo "Git HTTP Proxy off"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo ".zshrc sourced"
