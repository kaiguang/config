# Better Git experience in Bash
# https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
# curl -o ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -o ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Replace the PS1 assignments around line 60 and 62
# This basically appends \[\033[33m\]$(__git_ps1 "(%s)")\[\033[00m\] to the tailing \$
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[33m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\[\033[33m\]$(__git_ps1 "(%s)")\[\033[00m\]\$ '
fi

# Aliases
alias v='nvim'
alias lg='lazygit'

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}
