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

brew tap miccal/miccal
```
### Homebrew installs
```bash
HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-little-snitch

cd "$(brew --caskroom)"; rm -r m-little-snitch; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install bash curl ghostscript git pass pinentry-mac vim m-dropbox m-keepingyouawake m-rectangle-pro

cd "$(brew --caskroom)"; rm -r m-dropbox; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-mactex

cd "$(brew --caskroom)"; rm -r m-mactex; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install aspell gh gnuplot jupyterlab mas pdftoipe pwgen rsync m-apparency m-devtoys m-dwsim m-folx m-google-chrome m-launchcontrol m-libreoffice m-mathpix-snipping-tool m-microsoft-defender m-microsoft-outlook m-microsoft-teams m-mpv m-obs m-omnidisksweeper m-onedrive m-processspy m-proxyman m-sagemath m-slack m-suspicious-package m-tex-live-utility m-texshop m-textbuddy m-tor-browser m-vmware-horizon-client m-wolfram-engine m-xquartz m-zoomus
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
```
For `homebrew-cask`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-cask

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)
```
For `homebrew-core`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core

git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)
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
origin	https://github.com/homebrew/homebrew-cask (fetch)
origin	https://github.com/homebrew/homebrew-cask (push)
```
For `homebrew-core`:
```bash
cd "$(brew --repository)"/Library/Taps/homebrew/homebrew-core

git remote -v
```
Expected output:
```bash
origin	https://github.com/Homebrew/homebrew-core (fetch)
origin	https://github.com/Homebrew/homebrew-core (push)
```
### Manual PR's

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

git push BRANCH

git fetch --all

git fetch origin pull/ID/head:BRANCH

git rebase --interactive origin/master # squash

git push --force BRANCH

git push --force-with-lease BRANCH

git checkout master

git branch

git branch --delete --force BRANCH

git branch -a

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
