source ~/.bash_prompt
source ~/.bashrc
source ~/.alias

function tabtitle{ /bin/echo -e "\033];$*\007";}

#Enable Bash Completion
#if [ -f /opt/local/etc/bash_completion ]; then
#	. /opt/local/etc/bash_completion
#fi
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

#PIP and virtualenv Stuff
export PIP_RESPECT_VIRTUALENV=true
export PIP_DOWNLOAD_CACHE=$HOME/.pip_download_cache
export PIP_REQUIRE_VIRTUALENV=true

# homebrew
pyver=`python -c "from distutils import sysconfig; print sysconfig.get_python_version()"`
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/etc/Caskroom"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
#export PYTHONPATH=/usr/local/lib/python${pyver}/site-packages:$PYTHONPATH
# hack gtk-2.0
#export PYTHONPATH=/usr/local/lib/python${pyver}/site-packages/gtk-2.0:$PYTHONPATH
# https://github.com/mxcl/homebrew/issues/16891
export PKG_CONFIG_PATH=`brew --prefix libffi`/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH

#History
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#.alias .pipconfig .homebrewconfig .otherconfig
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
. "$HOME/.cargo/env"
