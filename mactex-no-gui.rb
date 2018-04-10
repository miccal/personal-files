cask 'mactex-no-gui' do
  version '20170524'
  sha256 :no_check

  url "http://mirror.aarnet.edu.au/pub/CTAN/systems/mac/mactex/mactex-#{version}.pkg"
  name 'MacTeX'
  homepage 'https://www.tug.org/mactex/'

  depends_on formula: 'ghostscript'

  pkg "mactex-#{version}.pkg"
      # installer -showChoicesXML -pkg mactex-#{version}.pkg -target /
      choices: [
                 {
                   # TeXLive
                   'choiceIdentifier' => 'choice1',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 1,
                 },
                 {
                   # GUI-Applications
                   'choiceIdentifier' => 'choice2',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
                 {
                   # Ghostscript
                   'choiceIdentifier' => 'choice3',
                   'choiceAttribute'  => 'selected',
                   'attributeSetting' => 0,
                 },
               ]
end
