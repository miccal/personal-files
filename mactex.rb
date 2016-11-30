cask 'mactex' do
  version '20161009'
  sha256 'b44873d445881900401d0e0eddccc78140b9ed51b538364889eb8529350d5bd7'

  url "http://dante.ctan.org/tex-archive/systems/mac/mactex/mactex-#{version}.pkg"
  name 'MacTeX'
  homepage 'https://www.tug.org/mactex/'

  pkg "mactex-#{version}.pkg"
end
