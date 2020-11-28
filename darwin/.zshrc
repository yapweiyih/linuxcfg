export PATH=$HOME/bin:$PATH
export CLICOLOR=1

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -al'
alias vi='vim'
alias reset_title='echo -e "\033];\007"'
alias gbvv="git branch -vv | egrep '^.*(behind|ahead).*|$'"

export LANG=en_US.utf-8
export LC_ALL=${LANG}
export LESS='-FMRX'

man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
		man "$@"
}

################################################################################
# Somewhat bash-like history
################################################################################
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=99999
HISTFILESIZE=99999
unsetopt hist_beep
unsetopt inc_append_history
unsetopt share_history
setopt append_history
setopt hist_find_no_dups
setopt hist_reduce_blanks
#setopt histignorealldups

################################################################################
# Completion
################################################################################
FPATH=/usr/local/share/zsh-completions:$FPATH
autoload -Uz compinit
#for dump in ~/.zcompdump(N.mh+24); do
#    # https://medium.com/@dannysmith/little-thing-2-speeding-up-zsh-f1860390f92
#    # Section "What else is slow then?"
#    compinit
#done
compinit -C

# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html#cli-command-completion-configure
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

setopt autoparamslash

# https://superuser.com/a/1020116
zstyle ':completion:*:*:*:*:*' menu select # https://superuser.com/a/1020116

################################################################################
# Enriched prompt
################################################################################
autoload -Uz vcs_info && vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats ' (%b)'
setopt PROMPT_SUBST
precmd() { vcs_info }
aws_profile() {
    # For https://github.com/remind101/assume-role/ which adds ASSUME_ROLE
    # to the current shell process.
    local assumed_role=""
    if [[ -n "$ASSUMED_ROLE" ]]; then
        assumed_role="%B%F{yellow}$ASSUMED_ROLE%f%b"
    fi

    # Isengard cli spanws a new shell process.
    local profile_name=""
    if [[ -n "$AWS_DEFAULT_PROFILE" ]]; then
        profile_name="%B%F{red}$AWS_DEFAULT_PROFILE%f%b"
    elif [[ -n "$AWS_PROFILE" ]]; then
        profile_name="%B%F{red}$AWS_PROFILE%f%b"
    fi

    if [[ -n "$profile_name" && -n "$assumed_role" ]]; then
        echo -n " %F{white}[$profile_name, $assumed_role%F{white}]"
    elif [[ -n "$assumed_role" ]]; then
        echo -n " %F{white}[$assumed_role%F{white}]"
    elif [[ -n "$profile_name" ]]; then
        echo -n " %F{white}[$profile_name%F{white}]"
    fi
}

prompt_prefix() {
    local retval=""

    # Be aware when some CLI toolkits (e.g., assume role) spawns a new shell.
    [[ ${SHLVL} -gt 1 ]] && retval=${retval}"%B%F{yellow}[${SHLVL}]%f%b "

    # Be aware when running under midnight commander.
    [[ -v MC_SID ]] && retval=${retval}"%B%F{red}[mc]%f%b "

    echo -n "${retval}"
}

# Must use single quote for vsc_info_msg_0_ to work correctly
#export PROMPT='$(prompt_prefix)%F{cyan}%n@%F{green}%m:%F{white}%~%B%F{magenta}${vcs_info_msg_0_}%b$(aws_profile)%F{gray}
export PROMPT='$(prompt_prefix)[%F{green}%~%F{white}]%B%F{magenta}${vcs_info_msg_0_}%b$(aws_profile)%F{gray}
%# '


################################################################################
# PyEnv
################################################################################
if command -v pyenv 1>/dev/null 2>&1; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"

    # Prefer manual activation even if per-project virtualenv is defined.
    # Apart from full control, want to be able to 'reset' on tmux or jupyter
    #if which pyenv-virtualenv-init > /dev/null; then
    #    eval "$(pyenv virtualenv-init -)"
    #fi

    # Note that these will have no effect if pyenv-virtualenv-init is enabled.
    [[ -z "$TMUX" ]] || pyenv deactivate
    [[ -z "$JUPYTER_SERVER_ROOT" ]] || pyenv deactivate
fi

################################################################################
# Keybindings
################################################################################
source ~/.zshrc-keybindings.darwin
