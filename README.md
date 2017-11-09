### Create macos bootable usb
```bash
sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/Untitled --applicationpath /Applications/Install\ macOS\ High\ Sierra.app --nointeraction
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
brew tap caskroom/drivers;
brew tap caskroom/eid;
brew tap caskroom/fonts;
brew tap caskroom/versions;
brew tap homebrew/bundle;
brew tap vitorgalvao/tiny-scripts
```
### Homebrew installs
```bash
brew cask install xquartz

brew cask install dropbox

brew cask install https://raw.githubusercontent.com/miccal/personal-files/master/mactex.rb

cd /usr/local/Caskroom/; rm -r mactex; cd

brew cask zap --force
bibdesk
latexit
excalibur

brew cask install
aquaterm
atom
bwana
djview
ipe
java6
keepingyouawake
keyboard-cleaner
libreoffice
linear
mpv
torbrowser
transmission
ubersicht

brew install
aspell
bash
cask-repair
cheat
curl
git
gnuplot --with-aquaterm
mpw
pass
pdftoipe
python3
vim --with-override-system-vi
wifi-password

brew cask install little-snitch

cd /usr/local/Caskroom/; rm -r little-snitch; cd
```
### Homebrew bundle
```bash
brew bundle dump --verbose --force --file=/Users/miccal/dropbox/.Brewfile

brew bundle install --verbose --file=/Users/miccal/dropbox/.Brewfile
```
### Homebrew maintenance
```bash
brew update --force; brew upgrade --cleanup; brew cleanup -s; brew cask cleanup; brew cask outdated --greedy

brew doctor

cd "$(brew --repository)"; git fetch; git reset --hard origin/master; cd

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
### Symlinks
```bash
ln -s ~/Dropbox/.password-store ~/.password-store

ln -s ~/Dropbox/.bash_profile ~/.bash_profile

ln -s ~/Dropbox/.gnupg ~/.gnupg

ln -s ~/Dropbox/.atom ~/.atom

ln -s ~/Dropbox/.vimrc ~/.vimrc
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
cd /Users/miccal/Dropbox/.dropbox.cache; ls -l
```
`rm -r` everything except for `attrs_cache`, `placeholder_cache` and `prefetch_cache`.

Remove conflicted files:
```bash
cd /Users/miccal/Dropbox; sudo find . -iname "*conflicted*" -delete; cd
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

trust
```
If `gpg: WARNING: unsafe permissions on homedir '/Users/miccal/.gnupg'` is shown, run
```bash
chmod 700 ~/.gnupg
```
### Gpg-agent
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

cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask/Casks

git config --local hub.protocol https

hub fork
```
### Git setup
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git remote add miccal https://github.com/miccal/homebrew-cask

git remote set-url miccal https://github.com/miccal/homebrew-cask
```
### Git check
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask

git remote -v
```
Expected output:
```bash
cask-repair	https://github.com/miccal/homebrew-cask (fetch)
cask-repair	https://github.com/miccal/homebrew-cask (push)
miccal	https://github.com/miccal/homebrew-cask.git (fetch)
miccal	https://github.com/miccal/homebrew-cask.git (push)
origin	https://github.com/caskroom/homebrew-cask (fetch)
origin	https://github.com/caskroom/homebrew-cask (push)
```
### Cask repair
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask/Casks

cask-repair CASK

cask-repair -e CASK

cask-repair -v VERSION CASK
```
### Update homebrew-cask fork
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-versions; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-drivers; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-fonts; git checkout master; git pull origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-eid; git checkout master; git pull origin; git push miccal master; cd
```

To force the update:
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask; git checkout master; git pull --unshallow origin; git push --force "miccal" master; cd
```
### Create a cask

_!!!UPDATE FORK FIRST!!!_
```bash
cd "$(brew --repository)"/Library/Taps/caskroom/homebrew-cask/Casks

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
### Show/hide hidden files
```bash
defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder

defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder
```
