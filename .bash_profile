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

## GIT shortcuts
alias pruneLocal="git branch --merged | egrep -v \"^\*|master\" | xargs -n 1 git branch -d"

## NPM
alias pnpm="npm --always-auth false  --registry http://registry.npmjs.org"

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

function server-php() {
  local port="${1:-9000}"
  open "http://localhost:${port}/"
  php -S localhost:${port}
}

## Export GIT Stuff
function gitexport() {
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}

## Create Animated Gif
function gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == "--small" ]]; then
      ffmpeg -i $1 -r 3 -filter:v scale=200:-1 -f gif - | gifsicle --optimize=3 --delay=20 > $1.gif
    else
      ffmpeg -i $1 -r 3 -f gif - | gifsicle --optimize=3 --delay=20 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

#################################
# Extras
#################################

if [[ -f ~/.extras ]]; then
  . ~/.extras
fi

#################################
# Sync
#################################

## Push
function save_dotfiles() {
  source ~/.bash_profile
  local gitdir="$HOME/Development/derricks-dynamite-dotfiles/.git/"
  local workingdir="$HOME/Development/derricks-dynamite-dotfiles/"
  echo "What did you change? "
  read commitMsg
  rsync -L ~/.bash_profile ~/Development/derricks-dynamite-dotfiles
  git --git-dir=$gitdir --work-tree=$workingdir add -A
  git --git-dir=$gitdir --work-tree=$workingdir commit -m "$commitMsg"
  git --git-dir=$gitdir --work-tree=$workingdir push origin master
}

## Pull
function update_dotfiles() {
  local gitdir="$HOME/Development/derricks-dynamite-dotfiles/.git/"
  local workingdir="$HOME/Development/derricks-dynamite-dotfiles/"
  git --git-dir=$gitdir --work-tree=$workingdir pull origin master
  rsync ~/Development/derricks-dynamite-dotfiles/.bash_profile ~/Development/derricks-dynamite-dotfiles/.bashrc ~/
  source ~/.bash_profile && source ~/.bashrc
}
