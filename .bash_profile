export PS1='\[\e[1;38;5;$((RANDOM%256))m\]\s-\V-\[\e[m\] \[\e[1;38;5;$((RANDOM%256))m\]$PWD\[\e[m\] \[\e[1;38;5;$((RANDOM%256))m\]($(ls -al1 | wc -l | sed "s/ //g"))\[\e[m\] \[\e[1;38;5;$((RANDOM%256))m\][>\[\e[m\] '

# \s = shell name, \V = version and patchlevel of shell, $PWD = print working directory, $(ls -al1 | wc -l | sed "s/ //g") = shows number of files in current working directory.

# \[\e[x;38;5;COLORm\] where x = 0 for normal, x = 1 for bold, x = 2 for faint, x = 3 for italic, x = 4 for underline, x = 5 for blink, x = 7 for reverse.

# \[\e[m\] resets to default.

# COLOR = number between [0,255] - see https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg

# $((x+RANDOM%(y-x+1))) generates a random integer between [x,y].

export PATH="/usr/local/opt/curl/bin:$PATH"

export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export EDITOR='atom --wait'

export HOMEBREW_NO_ANALYTICS=1

export HOMEBREW_DEVELOPER=1

export HOMEBREW_FORCE_BREWED_CURL=1

export HOMEBREW_GIT=/usr/local/opt/git/bin/git

sfind ()
{
  sudo find / -iname "*$1*"
}

alias chrome='open "/Applications/Google Chrome.app" --args --incognito --window-position=0,0 --window-size=2000,2000 https://now.foxtel.com.au'

alias masterpass='mpw -u "Miccal Matthews" -F none -t long -c'

alias update='softwareupdate -ia --verbose; brew update --force; brew upgrade --cleanup; brew cleanup -s; brew cask cleanup; brew cask outdated --greedy'

alias cdcasks='cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks"'

alias push='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull origin; git push "miccal" master; cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-versions; git checkout master; git pull origin; git push "miccal" master; cd'

alias sha='shasum -a 256'

alias appcast='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/find_sparkle_appcast"'

alias checkpoint='brew cask _appcast_checkpoint --calculate'

alias pkginstall='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_payload_in_pkg"'

alias pkgapps='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_apps_in_pkg"'

alias pkguninstall='"$(brew --repository)/Library/Taps/caskroom/homebrew-cask/developer/bin/list_ids_in_pkg"'

alias dropsync='rsync -a -v --delete /users/miccal/dropbox /users/miccal/documents'

alias dropcache='cd /Users/miccal/Dropbox/.dropbox.cache; ls -l'

alias dropcleanlist='cd /Users/miccal/Dropbox; sudo find . -iname "*conflicted*"; cd'

alias dropclean='cd /Users/miccal/Dropbox; sudo find . -iname "*conflicted*" -delete; cd'
