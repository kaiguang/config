# Git auto completion
autoload -Uz compinit && compinit

# Show Git info in prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr ' *'
zstyle ':vcs_info:git:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{yellow}(%r:%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow}(%r:%b|%a%u%c)%f'

# Prompt
export PS1='%F{cyan}%~%f${vcs_info_msg_0_}%# '
# Draw a line between commands
setopt promptsubst
PS1=$'${(r:$COLUMNS::_:)}'$PS1

# Aliases
alias ll='ls -alFGh'
alias history='history 1'
alias v='nvim'
alias vi='nvim'

bindkey -r "^L" # Remove key binding for clear screen

# Terminal tab title
DISABLE_AUTO_TITLE="true"
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}

