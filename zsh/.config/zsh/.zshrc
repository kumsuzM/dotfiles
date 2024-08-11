# Enable colors and change prompt:
autoload -U colors && colors

# colors required for git file info stuff - see commented out
# block in git prompt function
# RED='\033[0;31m'
# GREEN='\033[0;32m'
# YELLOW='\033[0;33m'

# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ "$(git status --porcelain 2> /dev/null)" != "" ] && indicator="*"
    [ -n "${branch}" ] && echo " (${branch}${indicator})"
    
    # This method provides more comprehensive info but also makes my shell extremely
    # buggy for no reason, sus it out later
    # local git_status="$(git status --porcelain 2> /dev/null)"
    # if [ -n "$git_status" ]; then
    #   mod=$(echo "$git_status" | grep '^[A-Z ]M ' | wc -l | tr -s ' ' | sed 's/^[ ]//g' 2> /dev/null)
    #   stg=$(echo "$git_status" | grep '^[A-Z]' | wc -l | tr -s ' ' | sed 's/^[ ]//g' 2> /dev/null)
    #   del=$(echo "$git_status" | grep '^[A-Z ]D' | wc -l | tr -s ' ' | sed 's/^[ ]//g' 2> /dev/null)
    #   unt=$(echo "$git_status" | grep '?? ' | wc -l | tr -s ' ' | sed 's/^[ ]//g' 2> /dev/null)
    #   if [ $mod != 0 ]; then git_file_info="${git_file_info} ${YELLOW}${mod}M${RESET}"; fi
    #   if [ $del != 0 ]; then git_file_info="${git_file_info} ${RED}${del}D${RESET}"; fi
    #   if [ $unt != 0 ]; then git_file_info="${git_file_info} ${RED}${unt}U${RESET}"; fi
    #   if [ $stg != 0 ]; then git_file_info="${git_file_info} ${GREEN}${stg}S${RESET}"; fi
    # fi
    # [ -n "${branch}" ] && echo " (${branch}${git_file_info})"

}

setopt PROMPT_SUBST
PROMPT='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[yellow]%}]$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '


# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.local/share/zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# Load aliases if existent
[ -f "$HOME/.config/shell/aliases.zsh" ] && source "$HOME/.config/shell/aliases.zsh"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # macOS `ls`
    colorflag="-G"
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# custom functions
shis() {
	sed -E 's/ *$//g' "$HISTFILE" | # removes trailing spaces
	sort |
	uniq |
	fzf |
	xclip -in -selection clipboard
}

fcd() {
  cd "$(find ~/ -type d | fzf)" && ls -a
}

mkcd() {
  mkdir "$1" && cd "$1"
}

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

PATH="$HOME/.local/bin:$PATH" # adds my personal scripts to path


function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
}

# Load zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
