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
alias n='nvim'
alias c='code'

# Function for grep
function g() {
  grep --color -R --exclude-dir={node_modules,.git} --files-with-matches "$@"
}

# Set the tab title for Alacritty, doesn't work in tmux
function set-title() {
  echo -en "\e]0;$@\a"
}

# Toggle Alacritty light/dark themes with in-place editing
function alatog() {
  sed -e "7h; 7d; 8G;" -i.bak ~/.config/alacritty/alacritty.toml
}

# Clear screen and scrollback, works in terminal emulator, but not in tmux.
# In tmux, use additional C-k to clear the scrollback buffer. Ref: tmux.conf file.
ctrl_l() {
    builtin print -rn -- $'\r\e[0J\e[H\e[3J' >"$TTY"
    builtin zle .reset-prompt
    builtin zle -R
}
zle -N ctrl_l
bindkey '^l' ctrl_l

