# ── HISTORY ──────────────────────────────────────────────────────────────────

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS      # don't save duplicate commands
setopt HIST_IGNORE_SPACE     # commands starting with space aren't saved
setopt HIST_VERIFY           # show command before executing from history
setopt SHARE_HISTORY         # share history between terminal windows
setopt INC_APPEND_HISTORY    # write to history immediately, not on exit


# ── COMPLETION ───────────────────────────────────────────────────────────────

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

compdef dots=git

setopt AUTO_MENU             # show completion menu on tab
setopt COMPLETE_IN_WORD      # complete from both ends of a word
setopt ALWAYS_TO_END         # move cursor to end after completion

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"  # colored completions


# ── KEY BINDINGS ─────────────────────────────────────────────────────────────

bindkey -e                           # emacs key bindings (default terminal behavior)
bindkey '^[[A' history-search-backward   # up arrow searches history
bindkey '^[[B' history-search-forward    # down arrow searches history
bindkey '^[[H' beginning-of-line         # home key
bindkey '^[[F' end-of-line               # end key
bindkey '^[[3~' delete-char              # delete key


# ── ENVIRONMENT ──────────────────────────────────────────────────────────────

export EDITOR=nano           # change to nvim if you use it
export COLORTERM=truecolor
export TERM=xterm-256color
export MANPAGER="sh -c 'col -bx | bat -l man -p'"  # colored man pages via bat


# ── ALIASES ──────────────────────────────────────────────────────────────────

# ls → eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias lt='eza -la --icons --tree --level=2'
alias l='eza -l --icons --group-directories-first'

# cat → bat
alias cat='bat --style=plain'
alias cат='bat'              # with syntax highlighting and line numbers
alias less='bat --paging=always'

# grep → ripgrep
alias grep='rg'

# common shortcuts
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'

# pacman shortcuts
alias pacs='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacr='sudo pacman -Rns'
alias pacq='pacman -Q'
alias pacss='pacman -Ss'

# git shortcuts
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias glo='git log --oneline --graph'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'
alias gcb='git checkout -b'

# python
alias py='python'
alias python='python3'
alias pip='pip3'
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias activate='source .venv/bin/activate'

# docker
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias di='docker images'

# dotfiles
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ── PLUGINS ──────────────────────────────────────────────────────────────────

# syntax highlighting — commands turn green when valid, red when not
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# autosuggestions — suggests from history, accept with right arrow
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6c7086'   # Catppuccin overlay1


# ── PROMPT (starship) ────────────────────────────────────────────────────────

eval "$(starship init zsh)"
