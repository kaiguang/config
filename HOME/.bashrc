# Better Git experience in Bash
. ~/git-completion.bash
. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\w\[\033[00m\]\[\033[33m\]$(__git_ps1 " (%s)")\[\033[00m\]\$ '

# Draw a line between commands
shopt -s checkwinsize
draw_line()
{
  local COLUMNS="$COLUMNS"
  while ((COLUMNS-- > 0)); do
    printf '\u005f'
  done
}
PS1='$(draw_line)\n'$PS1

# Aliases
alias v='nvim'
alias vi='nvim'

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}
