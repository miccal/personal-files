export PS1='\[\e[1;38;5;$((RANDOM%256))m\]bash \V\[\e[m\]   \[\e[1;38;5;$((RANDOM%256))m\]$PWD\[\e[m\]   \[\e[1;38;5;$((RANDOM%256))m\]$(ls -Al1 | wc -l | sed "s/ //g")\[\e[m\]\n\[\e[1;38;5;$((RANDOM%256))m\]|->\[\e[m\] '

# \s = shell name, \V = version and patchlevel of shell, $PWD = print working directory, $(ls -Al1 | wc -l | sed "s/ //g") = shows number of files in current working directory (omitting . and .. from the count), \n = new line.

# \[\e[x;38;5;COLORm\] where x = 0 for normal, x = 1 for bold, x = 2 for faint, x = 3 for italic, x = 4 for underline, x = 5 for blink, x = 7 for reverse.

# \[\e[m\] resets to default.

# COLOR = number between [0,255] - see https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# $((x+RANDOM%(y-x+1))) generates a random integer between [x,y].

export EDITOR='/usr/bin/open -e -W'

export HOMEBREW_BINTRAY_KEY=$(cat ~/.homebrew_bintray_api_token)

export HOMEBREW_BINTRAY_USER=miccal

export HOMEBREW_CASK_OPTS="--no-quarantine"

export HOMEBREW_DEVELOPER=1

export HOMEBREW_DISPLAY_INSTALL_TIMES=1

export HOMEBREW_FORCE_BREWED_CURL=1

export HOMEBREW_FORCE_BREWED_GIT=1

export HOMEBREW_FORCE_VENDOR_RUBY=1

export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew_github_api_token)

export HOMEBREW_GIT_EMAIL=miccal.matthews@gmail.com

export HOMEBREW_GIT_NAME=miccal

# export HOMEBREW_NO_ANALYTICS=1

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/curl/bin:$PATH"

caskpr ()
{
  brew bump-cask-pr --no-browse --version="$1" "$2"
}

curlfollow ()
{
  curl -sLI "$1" | grep -i Location
}

formulapr ()
{
  brew bump-formula-pr --strict --no-browse --url="$1" "$2"
}

manpdf ()
{
  man -t "$1" | open -f -a Preview
}

sfind ()
{
  sudo find / -iname "*$1*"
}

alias artsync='rsync -a -v --delete ~/Library/Containers/com.apple.AMPArtworkAgent/Data/Documents/artwork ~/dropbox/pictures'

alias bing='cd ~/Dropbox/Code/ubersicht/bing; for i in $(cat url.txt) ; do curl -O -s $i ; done ; for file in HPI* ; do mv "$file" "$file.txt" ; done ; cd'

alias cdbrew='cd "$(brew --repository)"'

alias cdcasks='cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask'

alias cdcore='cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core'

alias cddrivers='cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers'

alias cdversions='cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions'

alias checktemp='sudo powermetrics -i 1 -n 1 | grep -i "temp"'

alias checkfan='sudo powermetrics -i 1 -n 1 | grep -i "fan"'

alias cltupdate='sudo rm -r -f /Library/Developer/CommandLineTools; sudo xcode-select --install'

alias dropcache='cd ~/Dropbox/.dropbox.cache; ls -A -l'

alias dropclean='cd ~/Dropbox; sudo find . -iname "*conflicted*" -delete; sudo find . -iname ".DS_Store" -delete; cd'

alias dropcleanlist='cd ~/Dropbox; sudo find . -iname "*conflicted*"; sudo find . -iname ".DS_Store"; cd'

alias dropsync='rsync -a -v --delete ~/dropbox ~/documents'

alias livecheck='brew livecheck --installed'

alias maple='/Library/Frameworks/Maple.framework/Versions/Current/bin/maple'

alias masterpass='mpw -u "Miccal Matthews" -F none -t long -c'

alias mp3count='find . -name "*.mp3" | wc -l'

alias pdf4='pdfjam --nup 2x2 --landscape --frame true --suffix "(4 pages per sheet)"'

alias prune='git remote prune miccal; git remote prune origin'

alias push='cd "$(brew --repository)"; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core; git checkout master; git pull --rebase origin; git push miccal master; cd'

alias sha='shasum -a 256'

alias spell='aspell --lang=en --mode=tex check'

alias textedit='/usr/bin/open -e -W'
 
alias update='brew update && brew outdated --greedy --verbose && brew upgrade --dry-run && brew cleanup -s && rm -r -f "$(brew --cache)"'
