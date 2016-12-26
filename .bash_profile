export PS1='\[\e[1;38;5;$((RANDOM%16))m\]\s-\V-\[\e[m\] \[\e[1;38;5;$((RANDOM%16))m\]$PWD\[\e[m\] \[\e[1;38;5;$((RANDOM%16))m\][>\[\e[m\] '

# \s = shell name, \V = version and patchlevel of shell, $PWD = print working directory.

# \[\e[x;38;5;COLORm\] where x = 0 for normal, x = 1 for bold, x = 2 for faint, x = 3 for italic, x = 4 for underline, x = 5 for blink, x = 7 for reverse.

# \[\e[m\] resets to default.

# COLOR = number between [0,255] - see https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg

# $((x+RANDOM%(y-x+1))) generates a random integer between [x,y].

export EDITOR='atom --wait'

export HOMEBREW_NO_ANALYTICS=1

alias update='softwareupdate -ia --verbose; brew update --force; brew upgrade --cleanup; brew cleanup -s; brew cask cleanup; brew cu'

alias cdcasks='cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks"'

alias push='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull origin; git push "miccal" master; cd'

alias sha='shasum -a 256'

alias appcast='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/find_sparkle_appcast"'

alias caskrepairedit='cask-repair -e -l origin -p miccal'

alias pkginstall='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_payload_in_pkg"'

alias pkgapps='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_apps_in_pkg"'

alias pkguninstall='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_ids_in_pkg"'

alias dropsync='rsync -a -v --delete /users/miccal/dropbox /users/miccal/documents'

alias dropcache='cd /Users/miccal/Dropbox/.dropbox.cache; ls -l'

alias dropcleanlist='cd /Users/miccal/Dropbox; sudo find . -iname "*conflicted*"; cd'

alias dropclean='cd /Users/miccal/Dropbox; sudo find . -iname "*conflicted*" -delete; cd'

checkpoint ()
{
  curl --compressed --location --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36' "$1" | /usr/bin/sed 's|<pubDate>[^<]*</pubDate>||g' | shasum --algorithm 256
}

caskrepairversion ()
{
  cask-repair -v $1 -l origin -p miccal $2
}
