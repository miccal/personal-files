cask 'iina-beta' do
  version '1.0.7-beta1'
  sha256 '40fb3442705e8ca1ab27c16e6dbdab9d41f926e4eeecb65c8f7829196b9cb863'

  url "https://dl.iina.io/IINA.v#{version}.dmg"
  name 'IINA'
  homepage 'https://iina.io/'

  auto_updates true
  conflicts_with cask: 'iina'
  depends_on macos: '>= :el_capitan'

  app 'IINA.app'
  binary "#{appdir}/IINA.app/Contents/MacOS/iina-cli", target: 'iina'
end
