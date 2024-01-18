# Better Git experience in Bash
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
# curl -o ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -o ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\w\[\033[00m\]\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# Aliases
alias v='nvim'

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}

# vi mode
set -o vi
