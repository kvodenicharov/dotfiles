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
    z
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

export PATH="$HOME/.ops-helpers:/opt/homebrew/opt/openjdk@11/bin:$PATH"
export PATH=$HOME/.ops-helpers:$PATH

export GPG_TTY=$(tty)

eval $(thefuck --alias)

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export XDG_CONFIG_HOME=$HOME/.config
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*' menu select

export LIMA_HOME="$HOME/.colima/_lima/"
export COLIMA_HOME="$HOME/.colima"
export TESTCONTAINERS_RYUK_DISABLED=true
