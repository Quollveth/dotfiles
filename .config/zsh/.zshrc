fpath+=($HOME/.local/share/pure)
autoload -U promptinit; promptinit
autoload -Uz compinit; compinit

#
#autoload -Uz vcs_info
alias reload='source $ZDOTDIR/.zshrc'

# Source the helper script with the add file and add plugin functions
source $ZDOTDIR/zsh-helpers

# Add other configuration files
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-functions"
zsh_add_file "zsh-applications"

# Options
setopt autocd extendedglob nomatch
#stty stop undef
unsetopt BEEP
zle_highlight=('paste:none')

# Colors and prompt
PS1='[%~]→ ' # Gets overwritten by starship, stays here anyways
autoload -U colors && colors

# Autocompletion
autoload -Uz +X compinit && compinit
zstyle ':completion:*' menu select

# History
export HISTSIZE=SAVEHIST=10000
export HISTFILE=~/.cache/zsh/history

unset ZSH_AUTOSUGGEST_USE_ASYNC

eval "$(starship init zsh)"

# yazi wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#
## Plugins, leave this at the end of the file just to be sure
#
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-history-substring-search"

# bun completions
[ -s "/home/quollveth/.bun/_bun" ] && source "/home/quollveth/.bun/_bun"

# pnpm
export PNPM_HOME="/home/quollveth/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
