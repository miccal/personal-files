cask 'mactex' do
  version '20170524'
  sha256 :no_check

  url "http://dante.ctan.org/tex-archive/systems/mac/mactex/mactex-#{version}.pkg"
  name 'MacTeX'
  homepage 'https://www.tug.org/mactex/'

  pkg "mactex-#{version}.pkg"
end
