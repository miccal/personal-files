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

alias push='cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull origin; git push "miccal" master'

alias dropsync='rsync -a -v --delete /users/miccal/dropbox /users/miccal/documents'
