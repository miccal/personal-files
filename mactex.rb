cask 'mactex' do
  version '20161009'
  sha256 :no_check

  url "http://dante.ctan.org/tex-archive/systems/mac/mactex/mactex-#{version}.pkg"
  name 'MacTeX'
  homepage 'https://www.tug.org/mactex/'

  pkg "mactex-#{version}.pkg"
end
