# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Activating VI mode in bash
# set -o vi

alias lang='exec /home/kasra/.config/i3/lang.sh'
alias youtube='mpsyt'
alias move='rsync -avhR --progress --remove-source-files'
alias copy='rsync -avhR --progress'
alias mp3-download='youtube-dl -x --audio-format mp3  --audio-quality  0'
alias weather='java -jar /home/kasra/.getweather/WeatherWebserivceCall.jar'
alias make-debian-package='dpkg-buildpackage -us -uc'
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


alias g++="g++ --std=c++0x"
# Nmap ip
# nmap -p 80 -T4 -A -v XX.XX.XX.1/24
alias tagger='java -jar /home/kasra/.elixir-tagger/elixir-lyrics-tagger-1.0-SNAPSHOT.jar'
alias negative='convert -negate'
alias butterfly='/home/kasra/.local/bin/butterfly.server.py --unsecure'
#alias markdownviewer="pandoc $1 | lynx"
alias routerip='traceroute 8.8.8.8'
alias radiojavan="mpv http://stream.radiojavan.com/radiojavan"
alias kralpop="mpv http://kralpopsc.radyotvonline.com/"
alias radiocheese='mpv http://thecheese.ddns.net:8004/stream'
alias twitter='rainbowstream'
alias nvlc='nvlc --no-fb-tty'
alias tmux-attach='tmux attach -t'
alias tmux='tmux -u'
alias foxit='exec ~/opt/foxitsoftware/foxitreader/FoxitReader'
alias win-foxit='env WINEPREFIX="/home/kasra/.wine" wine C:\\Program\ Files\ \(x86\)\\Foxit\ Software\\Foxit\ Reader\\Foxit\ Reader.exe'
alias playplay='playerctl play'
alias playpause='playerctl pause'
alias playnext='playerctl next; sleep .5; playerctl metadata; echo -e "\n"'
alias playback='playerctl previous'
alias playplaylist='mpv "https://www.youtube.com/playlist?list=PLIs3O8jOlzIIZibRp61bwevwQVW4FPIjp"'
alias vup='pactl set-sink-volume 1 +5%'
alias vdown='pactl set-sink-volume 1 -5%'
alias m='pactl set-sink-mute 1 toggle' 
alias shutup='python /home/kasra/.config/i3/shutupSpotifyAd.py >> /dev/null &'
alias calc='bc'
alias windows='cd /media/kasra/Windows8_OS/Users/Kasra'
alias mountwin='udisksctl mount --block-device /dev/sda5'
alias xclip='xclip -selection clipboard'
alias python='python3'
alias wireless='nmtui'
alias torrent='transmission-cli -w ~/Downloads/'
alias yank='xsel --display :0'
alias paste='xsel -o --display :0'
alias mpv-fb='mpv --vo=drm'
alias rss='newsboat'
alias startup='sudo vim /etc/rc.local'
alias vimrc="vim $HOME/.vimrc"
alias bashrc="vim $HOME/.bashrc"
## BEGIN Manjaro specific
alias apt-update='sudo pacman -Syy'
alias apt-upgrade='sudo pacman -Syu'
alias apt-install='sudo pacman -Sy'
alias apt-search='sudo pacman -Ss'
# END Manjaro specific
alias standby="systemctl suspend"
alias merge_audio_video="ffmpeg -i $0 -i $1 -c:v copy -c:a flac -map 0:v:0 -map 1:a:0 out.mkv"
to_mp3()
{
    input_file="${1}"
    output_file=`basename "${1%.*}".mp3`
    ffmpeg -i "${input_file}" -b:a 320k "${output_file}"
}

audio_record()
{
    audio_file_name=`date '+%Y-%m-%d_%H:%M:%S'.mp3`
    path='/home/kixz/Audio/'
    mkdir -p "${path}"
    ffmpeg -f alsa -ac 2 -i hw:1,0 -acodec libmp3lame -ab 320k "${path}${audio_file_name}"
}

# To make tmux does not mess vim status bar
TERM=screen-256color
EDITOR=vim
BROWSER=firefox
