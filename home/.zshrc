#Profiling Hook for Profiling Startup Time
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
	# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
	PS4=$'%D{%M%S%.} %N:%i> '
	exec 3>&2 2>$HOME/tmp/startlog.$$
	setopt xtrace prompt_subst
fi

# Python Configuration so Variables Set for virtualenvwrapper plugin
source ~/.pipconfig
source ~/.homebrewconfig

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

if [[ `uname` == "Darwin" ]]; then
  source $(brew --prefix)/share/antigen/antigen.zsh
fi

if [[ `uname` == "Linux" ]]; then
  source ~/.antigen/antigen.zsh
fi

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


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
# antigen bundle tmux
# antigen bundle vi-mode

# Load OS specific bundles
if [[ `uname` == "Darwin" ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx
    antigen bundle zsh-brew-services
fi

# TODO: Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply


source ~/.alias
#source ~/.nvmconfig
source ~/.otherconfig
source ~/.zsh_theme

#
# Turn Off Profiling
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
fi

yes | homeshick --quiet refresh 2
