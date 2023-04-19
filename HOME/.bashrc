
# Better Git experience in Bash
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\w\[\033[00m\]\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# Aliases
alias v='nvim'
alias vi='nvim'
