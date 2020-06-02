### Create macos bootable usb
```bash
sudo '/Applications/Install macOS Catalina.app/Contents/Resources/createinstallmedia' --volume /Volumes/Untitled --nointeraction --downloadassets
```
### Install macos updates
```bash
softwareupdate --all --install --force
```
### Command line tools for xcode
```bash
xcode-select --install
```
### Install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
### Homebrew taps
```bash
brew tap homebrew/cask

brew tap homebrew/cask-drivers

brew tap homebrew/cask-fonts

brew tap homebrew/cask-versions

brew tap homebrew/livecheck

brew tap miccal/miccal

brew tap vitorgalvao/tiny-scripts
```
### Homebrew installs
```bash
brew cask install little-snitch-nightly --no-quarantine

cd /usr/local/Caskroom/; rm -r little-snitch-nightly; cd

brew cask install little-snitch --no-quarantine

cd /usr/local/Caskroom/; rm -r little-snitch; cd

brew cask install keepingyouawake rectangle master-password dropbox --no-quarantine

brew install bash curl ghostscript git pass vim

brew cask install m-mactex-no-gui

cd /usr/local/Caskroom/; rm -r m-mactex-no-gui; cd

brew cask install bose-soundtouch bose-updater chromium google-chrome ipe launchcontrol m-iina m-libreoffice m-tex-live-utility m-tor-browser m-vlc mathpix-snipping-tool slack-beta spires texshop transmission ubersicht whatsapp zoomus

brew install aspell cask-repair imagemagick maxima mpw pdftoipe pwgen unar wxmaxima
```
### Homebrew maintenance
```bash
brew update --force; brew upgrade --display-times; brew cleanup -s; brew cask outdated --greedy --verbose; rm -rf "$(brew --cache)"

brew doctor

cd "$(brew --repository)"; git fetch; git reset --hard origin/master; cd

brew update-reset

brew deps --installed --tree

brew leaves

brew livecheck
```
### Set homebrew bash as default
List current shells:
```bash
cat /etc/shells
```
Add homebrew bash:
```bash
sudo vim /etc/shells
```
Add to last line:
```bash
/usr/local/bin/bash
```
Check list:
```bash
cat /etc/shells
```
Set default shell:
```bash
chsh -s /usr/local/bin/bash miccal
```
### Symlinks
```bash
ln -s ~/Dropbox/.bash_profile ~/.bash_profile

ln -s ~/Dropbox/.password-store ~/.password-store

ln -s ~/Dropbox/.brew_livecheck_watchlist ~/.brew_livecheck_watchlist

ln -s /usr/local/Cellar/wxmaxima/*/wxmaxima.app/ /Applications/
```
### Pass
```bash
pass init GPGID

pass insert -m NAME

pass generate -f -n GEN LENGTH

pass NAME

pass remove NAME

pass edit NAME
```
### Master password
```bash
mpw -u "Miccal Matthews" -F none -t long -c COUNTER NAME
```
### Maxima
Enable gnuplot functionality:
```bash
textedit ~/.maxima/maxima-init.mac
```
Add the following lines:
```bash
gnuplot_command:"/usr/local/bin/gnuplot"$
draw_command:"/usr/local/bin/gnuplot"$
```
### Dropbox cleanup
Clean up the cache:
```bash
cd ~/Dropbox/.dropbox.cache; ls -al
```
Remove conflicted files:
```bash
cd ~/Dropbox; sudo find . -iname "*conflicted*" -delete; cd
```
### Gpg
```bash
gpg --export GPGID > ~/Dropbox/.public.key

gpg --export-secret-key GPGID > ~/Dropbox/.private.key

gpg --import ~/Dropbox/.public.key

gpg --allow-secret-key-import --import ~/Dropbox/.private.key

gpg --list-keys

gpg --list-secret-keys

gpg --edit-key GPGID

trust
```
If `gpg: WARNING: unsafe permissions on homedir '~/.gnupg'` is shown, run
```bash
chmod 700 ~/.gnupg
```
### Gpg-agent
Create configuration file:
```bash
cd ~/.gnupg; touch gpg-agent.conf; textedit gpg-agent.conf
```
Add the following lines:
```bash
default-cache-ttl 0
max-cache-ttl 0
```
Reload `gpg-agent`:
```bash
gpg-connect-agent reloadagent /bye
```
### Aspell
```bash
aspell --lang=en --mode=tex check FILE.tex
```
### Hub setup
```bash
cd "$(brew --repository)" && hub issue
```
### Git setup
For `homebrew-cask`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-cask

git remote set-url miccal https://github.com/miccal/homebrew-cask
```
For `homebrew-cask-drivers`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-cask-drivers

git remote set-url miccal https://github.com/miccal/homebrew-cask-drivers
```
For `homebrew-cask-versions`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-cask-versions

git remote set-url miccal https://github.com/miccal/homebrew-cask-versions
```
For `homebrew-core`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-core

git remote set-url miccal https://github.com/miccal/homebrew-core
```
For `homebrew-livecheck`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-livecheck

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-livecheck

git remote set-url miccal https://github.com/miccal/homebrew-livecheck
```
### Git check
For `homebrew-cask`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-cask (fetch)
miccal	https://github.com/miccal/homebrew-cask (push)
origin	https://github.com/homebrew/homebrew-cask (fetch)
origin	https://github.com/homebrew/homebrew-cask (push)
```
For `homebrew-cask-drivers`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-cask-drivers (fetch)
miccal	https://github.com/miccal/homebrew-cask-drivers (push)
origin	https://github.com/Homebrew/homebrew-cask-drivers (fetch)
origin	https://github.com/Homebrew/homebrew-cask-drivers (push)
```
For `homebrew-cask-versions`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-cask-versions (fetch)
miccal	https://github.com/miccal/homebrew-cask-versions (push)
origin	https://github.com/homebrew/homebrew-cask-versions (fetch)
origin	https://github.com/homebrew/homebrew-cask-versions (push)
```
For `homebrew-core`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-core (fetch)
miccal	https://github.com/miccal/homebrew-core (push)
origin	https://github.com/Homebrew/homebrew-core (fetch)
origin	https://github.com/Homebrew/homebrew-core (push)
```
For `homebrew-livecheck`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-livecheck

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-livecheck (fetch)
miccal	https://github.com/miccal/homebrew-livecheck (push)
origin	https://github.com/homebrew/homebrew-livecheck (fetch)
origin	https://github.com/homebrew/homebrew-livecheck (push)
```
### Cask repair
```bash
cask-repair CASK

cask-repair --edit-cask CASK

cask-repair --cask-version VERSION CASK

cask-repair --blind-submit CASK

cask-repair --delete-branches
```
### Bump formula pr
```bash
HOMEBREW_GITHUB_API_TOKEN={TOKEN} brew bump-formula-pr --strict vim --url=https://github.com/vim/vim/archive/v{VERSION}.tar.gz --sha256={SHA} --no-browse

HOMEBREW_GITHUB_API_TOKEN={TOKEN} brew bump-formula-pr --strict git-gui --url=https://www.kernel.org/pub/software/scm/git/git-{VERSION}.tar.xz --sha256={SHA} --no-browse

HOMEBREW_GITHUB_API_TOKEN={TOKEN} brew bump-formula-pr --strict imagemagick --url=https://dl.bintray.com/homebrew/mirror/ImageMagick-{VERSION}.tar.xz --mirror=https://www.imagemagick.org/download/releases/ImageMagick-{VERSION}.tar.xz --sha256={SHA} --no-browse

HOMEBREW_GITHUB_API_TOKEN={TOKEN} brew bump-formula-pr --strict imagemagick@6 --url=https://dl.bintray.com/homebrew/mirror/imagemagick%406-{VERSION}.tar.xz --mirror=https://www.imagemagick.org/download/releases/ImageMagick-{VERSION}.tar.xz --sha256={SHA} --no-browse
```
### Update forks
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-livecheck; git checkout master; git pull origin; git push miccal master; cd
```
To force the update:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull --unshallow origin; git push --force miccal master; cd
```
### Manual PR's
_!!!UPDATE FORK FIRST!!!_

After `cd`'ing into the relevant directory:
```bash
git status

git checkout -b BRANCH

touch FILE.rb

textedit FILE.rb

git add FILE.rb

git rm FILE.rb

git commit --message "PR TITLE"

git commit --all --message "PR TITLE"

git commit --amend --message "PR TITLE"

git push miccal BRANCH

git fetch --all

git rebase --interactive origin/master # squash

git push --force miccal BRANCH

git push --force-with-lease miccal BRANCH

git checkout master

git branch

git branch --delete --force BRANCH
```
### List references in a remote repository
Example:
```bash
git ls-remote https://gitlab.com/MasterPassword/MasterPassword.git
```
### Show/hide hidden files
```bash
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder
```
### Filevault
List enabled users:
```bash
sudo fdesetup list
```
Remove `Guest` user:
```bash
sudo fdesetup remove -user Guest
```
### Set dock height
```bash
defaults write com.apple.dock tilesize -integer 40; killall Dock
```
### Disable spotlight
```bash
sudo mdutil -a -i off
```
