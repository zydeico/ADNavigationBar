Pod::Spec.new do |s|
  s.name             = 'ADNavigationBar'
  s.version          = '1.0.0'
  s.summary          = 'Use this simple library to re-use a beautiful and usable navigation bar into your iOS app.'
  s.description      = 'ADNavigationBar allows to developert to re-use a navigation bar into your iOS App, chek this amazing idea to re-use components into your app and integrate too.'

  s.homepage         = 'https://github.com/zydeico/ADNavigationBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zydeico' => 'zydeico@protonmail.com' }
  s.source           = { :git => 'https://github.com/zydeico/ADNavigationBar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/JDanVz'
  s.ios.deployment_target = '9.0'
  s.source_files = 'ADNavigationBar/Classes/**/*'
  # s.resource_bundles = {
  #   'ADNavigationBar' => ['ADNavigationBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.static_framework = true
  s.swift_version = '4.1'
  s.dependency 'Motion', '~> 3.1'
end
