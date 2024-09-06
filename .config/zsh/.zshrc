fpath+=($HOME/.local/share/pure)
autoload -U promptinit; promptinit
prompt purer

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
PS1='[%~]→ ' # Gets overwritten by purer, stays here anyways
autoload -U colors && colors

# Autocompletion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#
## Plugins, leave this at the end of the file just to be sure
#
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

unset ZSH_AUTOSUGGEST_USE_ASYNC
