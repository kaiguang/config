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

# Aliases
alias ll='ls -alFGh'
alias history='history 1'
alias v='nvim'
alias c='code'

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}

# Set the tab title for Alacritty
function set-title() {
  echo -en "\e]0;$@\a"
}

# vi mode
bindkey -v
bindkey -v '^?' backward-delete-char # Fix the backspace not deleting
zle-keymap-select() {
  # Change cursor style based on insert or normal mode
  case $KEYMAP in
    (vicmd) echo -ne "\e[2 q";;      # Non-blinking bar
    (viins|main) echo -ne "\e[5 q";; # Blinking vertical line
  esac
  zle reset-prompt
}
zle -N zle-keymap-select
