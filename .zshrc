if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	colored-man-pages
	colorize
	zsh-autosuggestions
	web-search
	history
	jsontools
	git
	thefuck
	sudo
    warhol
    fzf-tab
    zsh-syntax-highlighting
    alias-tips
)

ZSH_COLORIZE_TOOL=chroma

eval $(/opt/homebrew/bin/brew shellenv)

export VISUAL=nvim
export EDITOR=nvim
export TERM=xterm-256color
export BAT_THEME=kanagawa

export BROWSER="firefox"
export LOG4J2_APPENDER=PatternAppender

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
HIST_STAMPS="yyyy-mm-dd"

HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

eval "$(fnm env --use-on-cd --shell zsh)"

export FZF_DEFAULT_OPTS='--height=40% --preview="cat {}" --preview-window=right:60%:wrap'

source $ZSH/oh-my-zsh.sh
source ~/.user-aliases
source ~/.user-secrets

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.ops-helpers:/opt/homebrew/opt/openjdk@11/bin:$HOME/.bin:$PATH"
export PATH=$HOME/.ops-helpers:$PATH

export GPG_TTY=$(tty)

eval $(thefuck --alias)

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export XDG_CONFIG_HOME=$HOME/.config
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LIMA_HOME="$HOME/.colima/_lima/"
export COLIMA_HOME="$HOME/.colima"
export DOCKER_HOST="unix:///$COLIMA_HOME/default/docker.sock"

source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"


show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

# Main FZF options including colors and tmux

export FZF_KEYBINDS="--bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up,ctrl-f:preview-page-down,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,shift-up:preview-top,shift-down:preview-bottom,alt-up:half-page-up,alt-down:half-page-down"
export FZF_DEFAULT_OPTS="${FZF_KEYBINDS} --tmux"
export FZF_COMPLETION_TRIGGER='**'
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# MacOs cr*p
bindkey "ç" fzf-cd-widget

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*' menu select

source ~/fzf-git.sh/fzf-git.sh

eval "$(zoxide init --cmd cd zsh)"

. "$HOME/.local/bin/env"
export TESTCONTAINERS_RYUK_DISABLED=true
