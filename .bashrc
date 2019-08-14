#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" "\e[${value};...;${value}m"
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[30;43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " %sTEXT\e[m" "${seq0}"
			printf " \e[%s1mBOLD\e[m" "${vals:+${vals+$vals;}}"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# environment
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/most"
export BROWSER="/usr/bin/opera"
export XDG_BROWSER="/usr/bin/opera"
export HISTSIZE=5000
export HISTFILESIZE=10000
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# aliases
# alias df='grc df'
# alias mount='grc mount'
# alias mutt="offlineimap && mutt && offlineimap"
# alias suddenstrike='/home/alex/.local/share/Steam/steamapps/common/Sudden\ Strike\ 4/SuddenStrike4.x86_64'
alias cnf-lookup="cnf-lookup --colors"
alias dosbox="dosbox ~/Dosbox"
alias ds1='wine /home/alex/.PlayOnLinux/wineprefix/DS1/drive_c/"Program Files"/"Microsoft Games"/"Dungeon Siege"/DungeonSiege.exe width=1920 height=1200'
alias emacs="emacs -nw"
alias free='grc free'
alias getclip="xclip -selection c -o"
alias gittree="git log --pretty=format:'%an - %ar - %s' --graph"
alias ksp=" Games/KSP/KSP.x86_64"
alias l="lla"
alias la="ls -ah --group-directories-first --color=auto"
alias latexmk="latexmk -pdf -pvc"
alias ll="ls -lh --group-directories-first --color=auto"
alias lla="ls -lhav --group-directories-first --color=auto"
alias llax="lla -X"
alias llx="ll -X"
alias ls="ls -h --group-directories-first --color=auto"
alias lsblk='grc lsblk -p -o +FSTYPE'
alias lspci='grc lspci'
alias lx="l -X"
alias ping="/usr/local/bin/ping_timestamp"
alias pyradio="pyradio -s ~/.config/pyradio/stations.csv"
alias setclip="xclip -selection c"
alias steam="LD_PRELOAD=/usr/lib/libfreetype.so /usr/bin/steam -nochatui -nofriendsui"
alias vimdiff="nvim -d"

# functions
function mcd() {
	mkdir -p -- "$1" &&
	cd -P -- "$1" || exit
}

function ncmpcpp () {
	/usr/local/bin/ncmpcpp_i3
}

#function ls17() {
#	WINEARCH=win32 primusrun wine '.wine/drive_c/Program Files/Farming Simulator 2017/x86/FarmingSimulator2017Game.exe'
#}

#function ls17_64() {
#	primusrun wine '.wine/drive_c/Program Files/Farming Simulator 2017/x64/FarmingSimulator2017Game.exe'
#}

# man pages colored in less (not nessesary while pager = most)
# man() {
# 	env \
# 			LESS_TERMCAP_mb=$'\e[01;31m' \
# 			LESS_TERMCAP_md=$'\e[01;31m' \
# 			LESS_TERMCAP_me=$'\e[0m' \
# 			LESS_TERMCAP_se=$'\e[0m' \
# 			LESS_TERMCAP_so=$'\e[01;44;33m' \
# 			LESS_TERMCAP_ue=$'\e[0m' \
# 			LESS_TERMCAP_us=$'\e[01;32m' \
# 			man "$@"
#     }

# git prompt
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_STATESEPARATOR=" "
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWUPSTREAM=auto
PS1='\[\033[38;5;166m\][\u@\h\[\033[01;37m\] \W \e[44m\[\033[1;36m\]$(__git_ps1 "(%s)")\[\e[49m\033[38;5;166m\]]\$\[\033[00m\] '

