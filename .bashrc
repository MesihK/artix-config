#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
export TERMINAL=st

alias ls='ls --color=auto'
alias ll='ls -alF'

alias dmes='sudo dmesg | tail -n 20'
alias v3='vim ~/.config/i3/config'
alias v3b='vim ~/.config/i3blocks/config'
alias vb='vim ~/.bashrc'
alias vv='vim ~/.vimrc'
alias vs='source ~/.bashrc'
alias vt='vim ~/edu/tracker/tracker.csv'

#iastate vpn stuff
#put your password to .config/sshp !!!
alias vpn='openconnect-sso --server vpn.iastate.edu'
alias sshp='sshpass -f ~/.config/sshp ssh mesih@pronto.las.iastate.edu'
alias sshd='sshpass -f ~/.config/sshp ssh mesih@prontodtn.las.iastate.edu'
alias scpp='sshpass -f ~/.config/sshp scp'
alias pp='ping pronto.las.iastate.edu'
alias t='xclip -selection clipboard -i ~/work/token'
work=mesih@prontodtn.las.iastate.edu:/work/LAS/jernigan-lab/mesih
workp=mesih@prontodtn.las.iastate.edu:/work/LAS/jernigan-lab/mesih/work/protlang-iDCT

alias pfamscan='pfam_scan.pl -dir ~/.local/prog/pfam/33.1/ -fasta '
alias cseq='conda activate /home/mesih/env/seq'
alias cimp='conda activate /home/mesih/env/imp'
alias cdock='conda activate /home/mesih/env/dock'
alias ctm='conda activate /home/mesih/env/tm'
alias cesm='conda activate /home/mesih/env/esm'
alias cj='conda activate /home/mesih/env/jpy'
alias cf='conda activate /home/mesih/env/flask'
alias ce='conda activate /home/mesih/env/edu'
alias cv='conda activate /home/mesih/env/vue'
alias cpm='conda activate /home/mesih/env/pymol'
alias cdd='conda deactivate'

#alias ssho='ssh -i ~/.local/key/ssh-key-2021-12-23.key ubuntu@129.213.52.187'
#export orc='ubuntu@129.213.52.187'
#alias scpo='scp -i ~/.local/key/ssh-key-2021-12-23.key ' 

alias ssho='ssh -i ~/.local/key/ssh-key-2022-02-10.key ubuntu@150.136.169.1'
export orc='ubuntu@150.136.169.1:/home/ubuntu/'
alias scpo='scp -i ~/.local/key/ssh-key-2022-02-10.key '

alias ssho2='ssh -i ~/.local/key/ssh-key-2022-08-01.key ubuntu@129.213.125.244'
export orc2='ubuntu@129.213.125.244:/home/ubuntu/'
alias scpo2='scp -i ~/.local/key/ssh-key-2022-08-01.key '

alias sshy='ssh -i ~/.local/key/ssh-key-2022-02-16.key ubuntu@150.136.104.215'
export orcy='ubuntu@150.136.104.215:/home/ubuntu/'
alias scpy='scp -i ~/.local/key/ssh-key-2022-02-16.key '

alias yt-dl480='youtube-dl --external-downloader-args "-a -n 8 " --external-downloader axel -i -f "bestvideo[height<=480]+bestaudio/best[height<=480]" -o "%(title)s.%(ext)s"'
yt-opus(){
	youtube-dl --external-downloader-args "-a -n 8 " --external-downloader axel \
    -i --audio-format opus -f "bestaudio/best" --postprocessor-args \
	'-threads 4' -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}
duu(){
    sudo du -h -d "$1" > /tmp/size; ll -hS | awk '{print $5"\t"$9}' >> /tmp/size; \ 
    cat /tmp/size | grep -P '^[0-9,.]+[G]' | sort -t, -n -r; cat /tmp/size |  \
    grep -P '^[0-9,.]+[M]' | sort -t, -n -r; rm /tmp/size
}
export PATH=$PATH:~/.local/bin
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
