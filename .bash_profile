export PS1='\[\e[1;38;5;$((RANDOM%256))m\]bash \V\[\e[m\]\[\e[0;38;5;$((RANDOM%256))m\] | \[\e[m\]\[\e[1;38;5;$((RANDOM%256))m\]$PWD\[\e[m\]\[\e[0;38;5;$((RANDOM%256))m\] | \[\e[m\]\[\e[1;38;5;$((RANDOM%256))m\]$(ls -Al1 | wc -l | sed "s/ //g")\[\e[m\]\n\[\e[1;38;5;$((RANDOM%256))m\]|->\[\e[m\] '

# \s = shell name, \V = version and patchlevel of shell, $PWD = print working directory, $(ls -Al1 | wc -l | sed "s/ //g") = shows number of files in current working directory (omitting . and .. from the count), \n = new line.

# \[\e[x;38;5;COLORm\] where x = 0 for normal, x = 1 for bold, x = 2 for faint, x = 3 for italic, x = 4 for underline, x = 5 for blink, x = 7 for reverse.

# 38;5; for the foreground and 48;5; for the background.

# \[\e[m\] resets to default.

# COLOR = number between [0,255] - see https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# $((x+RANDOM%(y-x+1))) generates a random integer between [x,y].

export EDITOR='/usr/bin/open -e -W'

export HOMEBREW_AUTOREMOVE=1

export HOMEBREW_CASK_OPTS="--no-quarantine"

export HOMEBREW_DEVELOPER=1

export HOMEBREW_DISPLAY_INSTALL_TIMES=1

export HOMEBREW_FORCE_BREWED_CA_CERTIFICATES=1

export HOMEBREW_FORCE_BREWED_CURL=1

export HOMEBREW_FORCE_BREWED_GIT=1

export HOMEBREW_FORCE_VENDOR_RUBY=1

export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.homebrew_github_api_token)

export HOMEBREW_GIT_EMAIL=miccal.matthews@gmail.com

export HOMEBREW_GIT_NAME=miccal

export HOMEBREW_NO_INSTALL_FROM_API=1

export HOMEBREW_UPDATE_REPORT_ALL_FORMULAE=1

export PATH="/usr/local/opt/curl/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

appcast() { "$(brew --repository homebrew/cask)/developer/bin/find-appcast" "$1"; }

approvepr() { brew pr-publish --tap homebrew/cask --workflow publish-commit-casks.yml "$1"; }

approveprdrivers() { brew pr-publish --tap homebrew/cask-drivers --workflow publish-commit-casks.yml "$1"; }

approveprfonts() { brew pr-publish --tap homebrew/cask-fonts --workflow publish-commit-casks.yml "$1"; }

approveprversions() { brew pr-publish --tap homebrew/cask-versions --workflow publish-commit-casks.yml "$1"; }

artsync() { rsync -a -v --delete ~/Library/Containers/com.apple.AMPArtworkAgent/Data/Documents/artwork ~/Library/CloudStorage/Dropbox/pictures; }

bashsync() { rsync -a -v ~/.bash_profile ~/Library/CloudStorage/Dropbox; }

bing() { for i in $(cat ~/Library/CloudStorage/Dropbox/Code/shortcuts/bing/mktlist.txt) ; do curl --silent "http://www.bing.com/HPImageArchive.aspx?format=js&uhd=1&idx=0&n=1&mkt=$i" | grep --only-matching "\"url\":\"\/.*\.jpg" | sed 's/"url":"\/th?id=OHR\.//g' | sed 's/\.jpg.*//g' ; done; }

binggrep() { for i in $(cat ~/Library/CloudStorage/Dropbox/Code/shortcuts/bing/mktlist.txt) ; do curl --silent "http://www.bing.com/HPImageArchive.aspx?format=js&uhd=1&idx=0&n=1&mkt=$i" | grep --only-matching "\"url\":\"\/.*\.jpg" | sed 's/"url":"\/th?id=OHR\.//g' | sed 's/\.jpg.*//g' | grep -v ROW ; done; }

caskpr() { brew bump-cask-pr --no-browse --force --version="$1" "$2"; }

caskprlang() { /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask/developer/bin/update_multilangual_casks /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask/Casks/"$1".rb "$2"; }

cdbrew() { cd "$(brew --repository)"; }

cdcasks() { cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; }

cdcore() { cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core; }

cddrivers() { cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; }

cddropbox() { cd ~/Library/CloudStorage/Dropbox; }

cdversions() { cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; }

checkfan() { sudo powermetrics -i 1 -n 1 | grep -i "fan"; }

checktemp() { sudo powermetrics -i 1 -n 1 | grep -i "temp"; }

cltupdate() { sudo rm -r -f /Library/Developer/CommandLineTools; sudo xcode-select --install; }

curlfollow() { curl -sLI "$1" | grep -i Location; }

dockheight() { defaults write com.apple.dock tilesize -integer 40; killall Dock; }

dropcache() { cd ~/Library/CloudStorage/Dropbox/.dropbox.cache; ls -A -l; }

dropclean() { cd ~/Library/CloudStorage/Dropbox; sudo find . -iname "*conflicted*" -delete; sudo find . -iname ".DS_Store" -delete; cd; }

dropcleanlist() { cd ~/Library/CloudStorage/Dropbox; sudo find . -iname "*conflicted*"; sudo find . -iname ".DS_Store"; cd; }

dropsync() { rsync -a -v --delete ~/Library/CloudStorage/Dropbox ~/documents; }

formulapr() { brew bump-formula-pr --strict --no-browse --force --url="$1" "$2"; }

gpgreload() { gpgconf --kill gpg-agent; gpgconf --launch gpg-agent; }

jupyterclean () { sudo find . -type d -iname ".ipynb_checkpoints" | sed -e 's/^/"/g' -e 's/$/"/g' | tr '\n' ' ' | sed 's/$/\n/g'; }

manpdf() { man -t "$1" | ps2pdf - - | open -f -a Preview; }

mp3count() { find . -name "*.mp3" | wc -l; }

pdf4() { pdfjam --nup 2x2 --landscape --frame true --suffix "(4 pages per sheet)" "$1"; }

pipoutdated() { python3 -m pip list -o; }

pipupdate() { python3 -m pip install --upgrade "$1"; }

prlist() { gh pr list --limit=1000 | awk '{ print $1 }' > ~/Library/CloudStorage/Dropbox/Code/brew/list; }

prune() { git remote prune miccal; git remote prune origin; }

push() { cd "$(brew --repository)"; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; git checkout master; git pull --rebase origin; git push miccal master; cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core; git checkout master; git pull --rebase origin; git push miccal master; cd; }

sfind() { sudo find / -iname "*$1*"; }

sha() { shasum -a 256 "$1"; }

spell() { aspell --lang=en --mode=tex check "$1"; }

textedit() { /usr/bin/open -e -W "$1"; }

update() { brew update && brew outdated --greedy --verbose && brew upgrade --dry-run && brew cleanup -s --prune=all && rm -r -f "$(brew --cache)"; }
