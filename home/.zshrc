
#export PATH="/usr/local/bin/:$PATH"
#export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

source $(brew --prefix)/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#plugins=(git dircycle colored-man colorize github virtualenv zsh-syntax-highlighting git-extras history osx pip python screen sudo virtualenvwrapper aws brew)
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle python
antigen bundle history
antigen bundle screen
antigen bundle sudo
antigen bundle virtualenv
antigen bundle virtualenvwrapper
antigen bundle aws
antigen bundle command-not-found
antigen bundle autojump
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle HeroCC/LS_COLORS
antigen bundle common-aliases
antigen bundle zsh-dircolors-solarized
antigen bundle zsh-pip-completion


# Load OS specific bundles
if [[ `uname` == "Darwin" ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
    antigen bundle zsh-brew-services
fi

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting


# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

source ~/.alias
source ~/.pipconfig
source ~/.homebrewconfig
source ~/.otherconfig

