### Get latest macos installer
```bash
softwareupdate --fetch-full-installer --full-installer-version VERSION
```
### Create macos bootable usb
```bash
sudo '/Applications/Install macOS Sonoma.app/Contents/Resources/createinstallmedia' --volume /Volumes/Untitled --nointeraction --downloadassets
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

brew tap homebrew/cask-fonts

brew tap homebrew/cask-versions

brew tap miccal/miccal
```
### Homebrew installs
```bash
HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-little-snitch

cd "$(brew --caskroom)"; rm -r m-little-snitch; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install bash curl ghostscript git pass pinentry-mac vim dropbox-beta keepingyouawake rectangle-pro

cd "$(brew --caskroom)"; rm -r dropbox-beta; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-mactex-no-gui

cd "$(brew --caskroom)"; rm -r m-mactex-no-gui; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install aspell gh gnuplot jupyterlab mas pdftoipe pipgrip pwgen rsync typst unar apparency etrecheckpro folx google-chrome ipe launchcontrol m-dwsim m-libreoffice m-microsoft-outlook m-microsoft-teams m-mpv m-obs m-tex-live-utility m-tor-browser mathpix-snipping-tool microsoft-teams-classic omnidisksweeper onedrive sage slack-beta suspicious-package texshop textbuddy vmware-horizon-client zoom
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
Add to last line for Intel:
```bash
/usr/local/bin/bash
```
or for Arm:
```bash
/opt/homebrew/bin/bash
```
Check list:
```bash
cat /etc/shells
```
Set default shell for Intel:
```bash
chsh -s /usr/local/bin/bash miccal
```
or for Arm:
```bash
chsh -s /opt/homebrew/bin/bash miccal
```
### Symlinks
```bash
ln -s ~/Library/CloudStorage/Dropbox/.homebrew_github_api_token ~/.homebrew_github_api_token

ln -s ~/Library/CloudStorage/Dropbox/.password-store ~/.password-store
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

gpg --export GPGID > ~/Library/CloudStorage/Dropbox/.public.key

gpg --export-secret-key GPGID > ~/Library/CloudStorage/Dropbox/.private.key

gpg --import ~/Library/CloudStorage/Dropbox/.public.key

gpg --allow-secret-key-import --import ~/Library/CloudStorage/Dropbox/.private.key

gpg --list-keys --keyid-format short

gpg --list-secret-keys --keyid-format long

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
Note that for Intel:
```
|-> which pinentry-mac
/usr/local/bin/pinentry-mac
```
while for Arm:
```
|-> which pinentry-mac
/opt/homebrew/bin/pinentry-mac
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
For `homebrew-cask-fonts`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-fonts

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)

git remote add miccal https://github.com/miccal/homebrew-cask-fonts

git remote set-url miccal https://github.com/miccal/homebrew-cask-fonts
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
Note that for Intel:
```
|-> which gpg
/usr/local/bin/gpg
```
while for Arm:
```
|-> which gpg
/opt/homebrew/bin/gpg
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
For `homebrew-cask-fonts`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-fonts

git remote -v
```
Expected output:
```bash
miccal	https://github.com/miccal/homebrew-cask-fonts (fetch)
miccal	https://github.com/miccal/homebrew-cask-fonts (push)
origin	https://github.com/Homebrew/homebrew-cask-fonts (fetch)
origin	https://github.com/Homebrew/homebrew-cask-fonts (push)
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
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask-fonts; git checkout master; git pull --rebase origin; git push miccal master; cd
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
