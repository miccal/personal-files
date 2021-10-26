### Get latest macos installer
```bash
softwareupdate --fetch-full-installer --full-installer-version VERSION
```
### Create macos bootable usb
```bash
sudo '/Applications/Install macOS Monterey.app/Contents/Resources/createinstallmedia' --volume /Volumes/Untitled --nointeraction
```
### Install macos updates
```bash
softwareupdate --list

softwareupdate --all --install --force
```
### Command line tools for xcode
```bash
xcode-select --install
```
### Install homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### Homebrew taps
```bash
brew tap homebrew/cask

brew tap homebrew/cask-drivers

brew tap homebrew/cask-versions

brew tap miccal/miccal
```
### Homebrew installs
```bash
HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-little-snitch

cd /usr/local/Caskroom/; rm -r m-little-snitch; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install bash curl ghostscript git pass vim dropbox-beta keepingyouawake rectangle

cd /usr/local/Caskroom/; rm -r dropbox-beta; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-mactex-no-gui

cd /usr/local/Caskroom/; rm -r m-mactex-no-gui; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install aspell mpw pinentry-mac pdftoipe pwgen rsync unar wxmaxima apparency chromium etrecheckpro homebrew/cask/gitup google-chrome ipe launchcontrol m-iina m-libreoffice m-tex-live-utility m-tor-browser m-vlc mathpix-snipping-tool omnidisksweeper sage slack-beta suspicious-package texshop homebrew/cask/transmission ubersicht xquartz zoom
```
### Homebrew maintenance
```bash
brew update && brew outdated --greedy --verbose && brew upgrade --dry-run && brew cleanup -s && rm -r -f "$(brew --cache)"

brew deps --installed --tree
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

ln -s ~/Dropbox/.gitconfig ~/.gitconfig

ln -s ~/Dropbox/.gpg-agent.conf ~/.gnupg/gpg-agent.conf

ln -s ~/Dropbox/.homebrew_github_api_token ~/.homebrew_github_api_token

ln -s ~/Dropbox/.maxima-init.mac ~/.maxima/maxima-init.mac

ln -s ~/Dropbox/.password-store ~/.password-store

ln -s /usr/local/Cellar/wxmaxima/*/wxmaxima.app/ /Applications/wxMaxima
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
### Gpg
```bash
gpg --full-generate-key

gpg --export GPGID > ~/Dropbox/.public.key

gpg --export-secret-key GPGID > ~/Dropbox/.private.key

gpg --import ~/Dropbox/.public.key

gpg --allow-secret-key-import --import ~/Dropbox/.private.key

gpg --list-keys

gpg --list-secret-keys --keyid-format LONG/SHORT

gpg --armor --export GPGID

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
gpgconf --kill gpg-agent; gpgconf --launch gpg-agent
```
Add `pinentry-mac`:
```bash
echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
```
### Maxima
Enable gnuplot functionality:
```bash
cd ~/.maxima; touch maxima-init.mac; textedit maxima-init.mac
```
Add the following lines:
```bash
gnuplot_command:"/usr/local/bin/gnuplot"$
draw_command:"/usr/local/bin/gnuplot"$
```
Turn off dark mode for wxMaxima:
```bash
defaults write wxmaxima NSRequiresAquaSystemAppearance -bool yes
```
### Git setup
For `brew`:
```bash
cd "$(brew --repository)"

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/brew

git remote set-url miccal https://github.com/miccal/brew
```
For `homebrew-cask`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/homebrew-cask

git remote set-url miccal https://github.com/miccal/homebrew-cask
```
For `homebrew-cask-drivers`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/homebrew-cask-drivers

git remote set-url miccal https://github.com/miccal/homebrew-cask-drivers
```
For `homebrew-cask-versions`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/homebrew-cask-versions

git remote set-url miccal https://github.com/miccal/homebrew-cask-versions
```
For `homebrew-core`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/homebrew-core

git remote set-url miccal https://github.com/miccal/homebrew-core
```
### Git check
For `brew`:
```bash
cd "$(brew --repository)"

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/brew (fetch)
miccal	https://github.com/miccal/brew (push)
origin	https://github.com/Homebrew/brew (fetch)
origin	https://github.com/Homebrew/brew (push)
```
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
### Update forks
```bash
cd "$(brew --repository)"; git checkout master; git pull --rebase origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask; git checkout master; git pull --rebase origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-drivers; git checkout master; git pull --rebase origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-versions; git checkout master; git pull --rebase origin; git push miccal master; cd
```
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core; git checkout master; git pull --rebase origin; git push miccal master; cd
```
To force the update:
```bash
git checkout master; git pull --unshallow origin; git push --force miccal master; cd
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

git fetch origin pull/ID/head:BRANCH

git rebase --interactive origin/master # squash

git push --force miccal BRANCH

git push --force-with-lease miccal BRANCH

git checkout master

git branch

git branch --delete --force BRANCH

git branch -a

git remote prune miccal

git remote prune origin
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
