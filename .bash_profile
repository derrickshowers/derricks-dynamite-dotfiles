# Derrick's Dynamite (.)Dotfiles
# Author: Derrick Showers (@derrickshowers)
# Website: http://derrickshowers.com


#################################
# Settings
#################################

## Exports
export EDITOR="vim"



#################################
# Aliases
#################################

## Navigation Stuff
alias ll="ls -l"
alias cd..="cd .."

## Directory Shortcut
alias dev="cd ~/Development"




#################################
# Helper Functions
#################################

## Find Shorthand
function f() {
    find . -name "$1"
}

## Change Directory to  Forefront Finder Window.
function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

## Start Python Server (pass in port)
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

## Export GIT Stuff
function gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

## Create Animated Gif
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}





#################################
# BASH Prompt Stuff
#################################

## BASH Coloring
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset=`tput sgr0`
  c_user=`tput setaf 2; tput bold`
  c_path=`tput setaf 4; tput bold`
  c_git_clean=`tput setaf 2`
  c_git_dirty=`tput setaf 1`
else
  c_reset=
  c_user=
  c_path=
  c_git_cleanclean=
  c_git_dirty=
fi

## GIT Prompt
git_prompt ()
{
  if ! git rev-parse --git-dir > /dev/null 2>&1 || [[ $PWD == *Volumes* ]]; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="${c_git_clean}"
  else
    git_color=${c_git_dirty}
  fi

  echo " [$git_color$git_branch${c_reset}]"
}

## Make BASH Prettier
PROMPT_COMMAND='if [ ${#PWD} -gt 30 ]; then
myPWD=${PWD:0:12}...${PWD:${#PWD}-15}; else myPWD=$PWD; fi'
PS1='\n\[$(tput bold)\]\[$(tput setaf 5)\]\u \[$(tput sgr0)\]\[$(tput setaf 4)\]$myPWD\[$(tput sgr0)\]\[$(tput bold)\]$(git_prompt)\[$(tput sgr0)\]\n$ '







#################################
# Extras
#################################

if [ -f ~/.extras ]; then
  . ~/.extras
fi  