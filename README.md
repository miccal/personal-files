### Get latest macos installer
```bash
softwareupdate --list-full-installers
```
```bash
softwareupdate --fetch-full-installer --full-installer-version VERSION
```
### Create macos bootable usb
```bash
sudo '/Applications/Install macOS Sequoia.app/Contents/Resources/createinstallmedia' --volume /Volumes/Untitled --nointeraction
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
brew tap --force homebrew/cask

brew tap miccal/miccal
```
### Homebrew installs
```bash
HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-little-snitch

cd "$(brew --caskroom)"; rm -r m-little-snitch; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install bash curl git pass pinentry-mac vim m-dropbox m-keepingyouawake m-pearcleaner m-rectangle-pro

cd "$(brew --caskroom)"; rm -r m-dropbox; cd

HOMEBREW_CASK_OPTS="--no-quarantine" brew install m-mactex

HOMEBREW_CASK_OPTS="--no-quarantine" brew install aspell gh gnuplot jupyterlab mas pdftoipe pwgen rsync transmission-cli m-apparency m-etrecheckpro m-google-chrome m-ipe m-launchcontrol m-leader-key m-libreoffice m-mathpix-snipping-tool m-microsoft-outlook m-microsoft-teams m-mouseless m-mpv m-obs m-omnidisksweeper m-processspy m-proxyman m-sagemath m-slack m-suspicious-package m-tex-live-utility m-texshop m-textbuddy m-tor-browser m-z-library m-zoomus
```
### Homebrew maintenance
```bash
brew update && brew outdated --greedy --verbose && brew upgrade --dry-run && brew cleanup -s && rm -r -f "$(brew --cache)"

brew deps --installed --tree

brew deps --installed --graph
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
/opt/homebrew/bin/bash
```
Check list:
```bash
cat /etc/shells
```
Set default shell:
```bash
chsh -s /opt/homebrew/bin/bash NAME
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
pinentry-program /opt/homebrew/bin/pinentry-mac
```
Reload `gpg-agent`:
```bash
gpgconf --kill gpg-agent; gpgconf --launch gpg-agent
```
### Ipe
Create configuration file:
```bash
cd ~/.ipe; touch ipe.conf; textedit ipe.conf
```
Add the following line:
```bash
IPELATEXPATH=/Library/TeX/texbin
```
### Git setup
```bash
git config --global user.email "miccal.matthews@gmail.com"

git config --global user.name "miccal"

git config --global user.signingKey 'Miccal Matthews <miccal.matthews@gmail.com>'

git config --global commit.gpgSign true

git config --global gpg.program $(which gpg)
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
