### Create macos bootable usb
```bash
sudo '/Applications/Install macOS Catalina.app/Contents/Resources/createinstallmedia' --volume /Volumes/Untitled --nointeraction --downloadassets
```
### Install macos updates
```bash
softwareupdate -ia
```
### Command line tools for xcode
```bash
xcode-select --install
```
### Install homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### Homebrew taps
```bash
brew tap
homebrew/cask
homebrew/cask-drivers
homebrew/cask-versions
vitorgalvao/tiny-scripts
```
### Homebrew installs
```bash
brew cask install little-snitch-nightly --no-quarantine

cd /usr/local/Caskroom/; rm -r little-snitch-nightly; cd

brew cask install little-snitch --no-quarantine

cd /usr/local/Caskroom/; rm -r little-snitch; cd

brew cask install
keepingyouawake
shiftit
master-password
dropbox
--no-quarantine

brew install 
bash
curl
ghostscript
git
pass

brew cask install 
https://raw.githubusercontent.com/miccal/personal-files/master/mactex-no-gui.rb
mactex-no-gui

cd /usr/local/Caskroom/; rm -r mactex-no-gui; cd

brew cask install
bose-soundtouch
bose-updater
google-chrome
iina-beta
iina
ipe
https://raw.githubusercontent.com/miccal/personal-files/master/libreoffice.rb
libreoffice
mathpix-snipping-tool
tex-live-utility
texshop
tor-browser
transmission
ubersicht

brew install
aspell
cask-repair
cheat
gnuplot
mpw
pdftoipe
pwgen
unar
```
### Homebrew maintenance
```bash
brew update --force; brew upgrade --display-times; brew cleanup -s; brew cask outdated --greedy --verbose; rm -rf "$(brew --cache)"

brew doctor

cd "$(brew --repository)"; git fetch; git reset --hard origin/master; cd

brew update-reset

brew deps --installed --tree

brew leaves
```
### Set homebrew bash as default
List current shells:
```bash
cat /etc/shells
```
Add homebrew bash:
```bash
sudo textedit /etc/shells
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

ln -s ~/Dropbox/.gnupg ~/.gnupg

ln -s ~/Dropbox/.password-store ~/.password-store
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
gpg --export GPGID > Dropbox/.public.key

gpg --export-secret-key GPGID > Dropbox/.private.key

gpg --import Dropbox/.public.key

gpg --allow-secret-key-import --import Dropbox/.private.key

gpg --list-keys

gpg --list-secret-keys

gpg --edit-key GPGID

trust
```
If `gpg: WARNING: unsafe permissions on homedir '~/.gnupg'` is shown, run
```bash
chmod 700 ~/.gnupg
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

git remote add miccal https://github.com/miccal/homebrew-versions

git remote set-url miccal https://github.com/miccal/homebrew-versions
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
miccal	https://github.com/miccal/homebrew-versions (fetch)
miccal	https://github.com/miccal/homebrew-versions (push)
origin	https://github.com/homebrew/homebrew-cask-versions (fetch)
origin	https://github.com/homebrew/homebrew-cask-versions (push)
```
### Cask repair
```bash
cask-repair CASK

cask-repair --edit-cask CASK

cask-repair --cask-version VERSION CASK

cask-repair --blind-submit CASK

cask-repair --delete-branches
```
### Update homebrew-cask, homebrew-cask-drivers and homebrew-cask-versions forks
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; git checkout master; git pull origin; git push miccal master; cd
```
To force the update:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull --unshallow origin; git push --force "miccal" master; cd
```
### Create a cask

_!!!UPDATE FORK FIRST!!!_
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask/Casks

git status

git checkout -b BRANCH

textedit CASK.rb

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
