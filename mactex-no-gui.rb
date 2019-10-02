cask 'mactex-no-gui' do
  version '2019.0508'
  sha256 :no_check

  url "http://mirror.aarnet.edu.au/pub/CTAN/systems/mac/mactex/mactex-#{version.no_dots}.pkg"
  name 'MacTeX'
  homepage 'https://www.tug.org/mactex/'

  pkg "mactex-#{version.no_dots}.pkg"
      # installer -showChoicesXML -pkg mactex-#{version.no_dots}.pkg -target /
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

  uninstall pkgutil: "org.tug.mactex.texlive#{version.major}",
            delete:  "/usr/local/texlive/#{version.major}"
end
