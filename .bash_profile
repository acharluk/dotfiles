

## Custom ACharluk ##

export TERMINAL='xfce4-terminal'

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx;
fi

PATH = $PATH:~/.acharluk/scripts

## Your custom config ##
