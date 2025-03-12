export PGGSSENCMODE=disable
#add own completions to path
fpath=($HOME/.local/share/zsh/completions $fpath)
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
#load completions
autoload compinit
compinit -i
#load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

#format vcs_info variable
zstyle ':vcsinfo:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'

setopt PROMPT_SUBST
PROMPT='${vcs_info_msg_0_} %F{red}> %F{magenta}%1~ %F{yellow}$%f '

export PATH=$PATH:~/.bin
alias vim="nvim"
alias ls="ls --color"
alias l="ls -l"
alias lsa="ls -a"
alias la="l -a"
alias u="cd .."
alias cl="clear"
alias :q="exit"

export LS_COLORS='di=01;34:ln=01;36:so=01;35:pi=00;33'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#export LANG=de_DE.UTF-8
#export LC_ALL=de_DE.UTF-8
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#[ -f "/home/jared/.ghcup/env" ] && . "/home/jared/.ghcup/env" # ghcup-env
[ -f "/Users/I569414/.ghcup/env" ] && . "/Users/I569414/.ghcup/env" # ghcup-env
