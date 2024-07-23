# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


########################################################
#
#autoload -Uz vcs_info
alias reload='source $ZDOTDIR/.zshrc'


# Source the helper script with the add file and add plugin functions
source $ZDOTDIR/zsh-helpers


# Add other configuration files
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-functions"


# Options
setopt autocd extendedglob nomatch
#stty stop undef
unsetopt BEEP
zle_highlight=('paste:none')


# Colors and prompt
PS1='[%~]→ ' # Gets overwritten by p10k, stays here anyways
autoload -U colors && colors

# Autocompletion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select


# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Vi mod

bindkey -v
export KEYTIMEOUT=1
# Edit current command in vi
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


#
## Plugins, leave this at the end of the file just to be sure
#
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

unset ZSH_AUTOSUGGEST_USE_ASYNC
