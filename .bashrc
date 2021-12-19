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
alias vs='source ~/.bashrc'

#iastate vpn stuff
#put your password to .config/sshp !!!
alias vpn='openconnect-sso --server vpn.iastate.edu'
alias sshp='sshpass -f ~/.config/sshp ssh mesih@pronto.las.iastate.edu'
alias sshd='sshpass -f ~/.config/sshp ssh mesih@prontodtn.las.iastate.edu'
alias scpp='sshpass -f ~/.config/sshp scp'
work=mesih@prontodtn.las.iastate.edu:/work/LAS/jernigan-lab/mesih

alias pfamscan='pfam_scan.pl -dir ~/.local/prog/pfam/33.1/ -fasta '
alias cseq='conda activate /home/mesih/env/seq'
alias cimp='conda activate /home/mesih/env/imp'
alias cdock='conda activate /home/mesih/env/dock'

export PATH=$PATH:~/.local/bin
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
