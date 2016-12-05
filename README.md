### Create macos bootable usb
```bash
sudo /Applications/Install\ macOS\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ Sierra.app --nointeraction
```
### Show/hide hidden files
```bash
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder
```
### Enable trim
```bash
sudo trimforce enable
```
### Turn time machine snapshots off
```bash
sudo tmutil disablelocal
```
### Command line tools for xcode
```bash
xcode-select --install
```
### Install macos updates
```bash
softwareupdate -ia --verbose
```
### Install homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Homebrew taps
```bash
brew tap caskroom/cask; 
brew tap homebrew/head-only; 
brew tap vitorgalvao/tiny-scripts; 
brew tap buo/cask-upgrade
```
### Installs
```bash
brew cask install xquartz

brew cask install https://raw.githubusercontent.com/miccal/personal-files/master/dropbox.rb

cd /usr/local/Caskroom/; rm -r dropbox; cd

brew cask install https://raw.githubusercontent.com/miccal/personal-files/master/mactex.rb

cd /usr/local/Caskroom/; rm -r mactex; cd

brew cask install aquaterm atom djview ipe keepingyouawake libreoffice linear torbrowser transmission ubersicht; 
brew install bash cheat git gnuplot --with-aquaterm gpg hub mpv --with-bundle mpw pass; 
brew install --HEAD pdftoipe; 
brew install vitorgalvao/tiny-scripts/cask-repair; 
brew linkapps

brew cask install little-flocker

cd /usr/local/Caskroom/; rm -r little-flocker; cd

brew cask install little-snitch

cd /usr/local/Caskroom/; rm -r little-snitch; cd
```
### For rae
```bash
brew cask install xquartz libreoffice messenger transmission; 
brew install bash gpg mpv --with-bundle mpw pass; 
brew linkapps
```
### Homebrew maintenance
```bash
brew update --force; brew upgrade --cleanup; brew cleanup -s; brew cask cleanup; brew cu

brew doctor

cd "$(brew --repository)"; git fetch; git reset --hard origin/master; cd
```
### Set homebrew bash as default

List current shells:
```bash
cat /etc/shells
```
Add homebrew bash:
```bash
sudo atom /etc/shells
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
### Gpg
```bash
gpg --export GPGID > public.key

gpg --export-secret-key GPGID > private.key

gpg --import public.key

gpg --allow-secret-key-import --import private.key

gpg --list-keys

gpg --list-secret-keys

gpg --edit-key GPGID
```
### Pass
```bash
pass init GPGID

pass insert -m NAME

pass generate GEN LENGTH

pass NAME

pass remove NAME

pass edit NAME
```
### Master password
```bash
mpw -u "Miccal Matthews" -t long -c 1 NAME
```
### Symlinks
```bash
ln -s ~/Dropbox/.password-store ~/.password-store

ln -s ~/Dropbox/.bash_profile ~/.bash_profile

ln -s ~/Dropbox/.gnupg ~/.gnupg

ln -s ~/Dropbox/.atom ~/.atom
```
### Dropbox cleanup
```bash
cd .dropbox.cache; ls -l
```
`rm -r` everything except for `placeholder_cache` and `prefetch_cache`.
### Hub setup
```bash
cd "$(brew --repository)" && hub issue

cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks"

git config --local hub.protocol https

hub fork
```
### Git setup
```bash
cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-cask

git remote set-url miccal https://github.com/miccal/homebrew-cask
```
### Git check
```bash
cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask

git remote -v
```
Expected output:
```bash
miccal  https://github.com/miccal/homebrew-cask (fetch)
miccal  https://github.com/miccal/homebrew-cask (push)
origin  https://github.com/caskroom/homebrew-cask (fetch)
origin  https://github.com/caskroom/homebrew-cask (push)
```
### Cask repair
```bash
cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks"

cask-repair -l origin -p miccal CASK

cask-repair -e -l origin -p miccal CASK

cask-repair -v VERSION -l origin -p miccal CASK
```
### Update homebrew-cask fork
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull origin; git push miccal master; cd
```
### Create a cask

_!!!UPDATE FORK FIRST!!!_
```bash
cd "$(brew --repository)/Library/Taps/caskroom/homebrew-cask/Casks"

git status

git checkout -b BRANCH

atom CASK.rb

brew cask audit --download CASK

brew cask style --fix CASK

git add CASK.rb

git rm CASK.rb

git commit -m "PR TITLE"

git commit -am "PR TITLE"

git push miccal BRANCH

git push -f miccal BRANCH

git checkout master

git branch

git branch -D BRANCH
```
