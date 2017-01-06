cask 'test' do
  version '3.1.5-31304'
  sha256 '81aa7a70ec8db019f5ac5f03a436f7e59f361a04e71a8edcc58e758b9245f33a'

  url "http://download.parallels.com/pmobile/v#{version.major}/#{version}/ParallelsAccess-#{version}-mac.dmg"
  name 'Parallels Access'
  homepage 'https://www.parallels.com/products/access/'

  installer manual: 'Install.app'
end
