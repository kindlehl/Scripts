# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias ldapvi="ldapvi -D uid=$USER,ou=People,dc=osuosl,dc=org -h ldaps://ldap1.osuosl.org"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="refined"

# source other garbage
otherscripts=(
  ~/.openstack_secrets
  ~/.work_secretsrc
  ~/.work_specific
  $ZSH/oh-my-zsh.sh
  ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
)

for script in "$otherscripts[@]"; do
  if [ -f "$script" ]; then
    source "$script"
  fi
done

if which vim > /dev/null; then
  export EDITOR=vim
fi

if which chef > /dev/null; then
  eval "$(chef shell-init zsh)"
fi

#Environment Variable definitions export EDITOR='/usr/bin/vim' export VISUAL='/usr/bin/vim'
export PATH="$HOME/bin:/usr/local/bin:/opt/kitchen/bin:$PATH"
export TERM="xterm-256color"

force_color_prompt=yes

# Aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias c="clear"
alias config='vim ~/.config/terminator/config'
alias digs='dig +short'
alias digr='dig -x'
alias eb="$EDITOR ~/.bashrc"
alias gcf='git checkout --'
alias gc='git checkout'
alias gcm='git checkout master && git pull'
alias gl='git log --decorate --color --graph'
alias grc='git rebase --continue'
alias grm='git rebase master'
alias gs='git status'
alias gb='git branch'
alias kc='kitchen converge'
alias kd='kitchen destroy'
alias ke="kitchen exec $command"
alias kl='kitchen login'
alias kt='kitchen test'
alias kv='kitchen verify'
alias la='ls -A'
alias ll='ls -alF'
alias l='ls -CF'
alias nb='git checkout master && git pull origin master && git checkout -b'
alias project='vim -S $PROJECT_DIR/Session.vim'
alias resume='vim -S Session.vim'
alias rs='. ~/.bashrc'
alias sshstart='eval $(ssh-agent)'

if [ -f ~/.msg ]; then
  cat ~/.msg
fi

HISTCONTROL=ignoreboth

# Vi mode settings
set -o vi
export KEYTIMEOUT=1

# Adds notice for vim mode [NOMRAL] and [INSERT] depending on shell mode
function zle-line-init zle-keymap-select {
    VIM_NORMAL_PROMPT="%{$fg_bold[red]%} [% NORMAL]% %{$reset_color%}"
    VIM_INSERT_PROMPT="%{$fg_bold[yellow]%} [% INSERT]% %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL_PROMPT}/(viins|main)/$VIM_INSERT_PROMPT} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history
bindkey 'jk' vi-cmd-mode
