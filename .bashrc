#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ll='ls -alF'

alias dmes='dmesg | tail -n 20'
alias v3='vim ~/.config/i3/config'
alias v3b='vim ~/.config/i3blocks/config'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
