#add own completions to path
fpath=($HOME/.local/share/zsh/completions $fpath)
#load completions
autoload compinit
compinit -i
#load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

export PATH=$PATH:/home/Jared/.local/bin

#format vcs_info variable
zstyle ':vcsinfo:*' enable git svn
zstyle ':vcs_info:git:*' formats ' %F{green}%b%f'

set up the prompt
setopt PROMPT_SUBST

[[ -c /dev/null ]]  ||  return
zmodload zsh/system ||  return

## Set the transient prompt PROMPT here -
TRANSIENT_PROMPT='%F{yellow}━ %F{cyan}󰘧%f '   # Sample value

function set_prompt {
    ## Set the values of PROMPT and RPROMPT here
    # Sample values given below
    PROMPT='%F{yellow}┏ %F{red}%n ➜%F{magenta} %~%f${vcs_info_msg_0_}'$'\n''%F{yellow}┗ %F{cyan}󰘧%f '
    RPROMPT='%(?..%B%F{1}%?%f%b)'
}

typeset -g _transient_prompt_newline=
function _transient_prompt_set_prompt {
    set_prompt
    PROMPT=$_transient_prompt_newline$PROMPT
}; _transient_prompt_set_prompt

zle -N clear-screen _transient_prompt_widget-clear-screen
function _transient_prompt_widget-clear-screen {
    _transient_prompt_newline=
    zle .clear-screen
}

zle -N send-break _transient_prompt_widget-send-break
function _transient_prompt_widget-send-break {
    _transient_prompt_widget-zle-line-finish
    zle .send-break
}

zle -N zle-line-finish _transient_prompt_widget-zle-line-finish
function _transient_prompt_widget-zle-line-finish {
    (( ! _transient_prompt_fd )) && {
        sysopen -r -o cloexec -u _transient_prompt_fd /dev/null
        zle -F $_transient_prompt_fd _transient_prompt_restore_prompt
    }
    zle && PROMPT=$TRANSIENT_PROMPT RPROMPT= zle reset-prompt && zle -R
}

function _transient_prompt_restore_prompt {
    exec {1}>&-
    (( ${+1} )) && zle -F $1
    _transient_prompt_fd=0
    _transient_prompt_set_prompt
    zle reset-prompt
    zle -R
}

(( ${+precmd_functions} )) || typeset -ga precmd_functions
(( ${#precmd_functions} )) || {
    do_nothing() {true}
    precmd_functions=(do_nothing)
}

precmd_functions+=_transient_prompt_precmd
function _transient_prompt_precmd {
    # We define _transient_prompt_precmd in this way because we don't want
    # _transient_prompt_newline to be defined on the very first precmd.
    TRAPINT() {zle && _transient_prompt_widget-zle-line-finish; return $(( 128 + $1 ))}
    function _transient_prompt_precmd {
        TRAPINT() {zle && _transient_prompt_widget-zle-line-finish; return $(( 128 + $1 ))}
        _transient_prompt_newline=$'\n'
    }
}

export PATH=$PATH:~/.bin
alias vim="nvim"
alias ls="ls --color"
alias l="ls -l"
alias lsa="ls -a"
alias la="l -a"
alias u="cd .."
alias cl="clear"

export LS_COLORS='di=01;34:ln=01;36:so=01;35:pi=00;33'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
