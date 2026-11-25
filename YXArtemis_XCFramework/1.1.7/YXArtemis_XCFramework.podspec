Pod::Spec.new do |s|
  s.name             = 'YXArtemis_XCFramework'
  s.version          = '1.1.7'
  s.summary          = 'Netease IM YXArtemis'
  s.homepage         = 'http://netease.im'
  s.license          = { :type => 'Copyright', :text => ' Copyright 2026 Netease ' }
  s.authors          = 'Net ease IM Team'

  s.source           = { :http => 'https://yx-web-nosdn.netease.im/common/aa074ae226b979bc4b7cb73eb0eec5eb/YXArtemis_1.1.7.xcframework.zip' }

  s.platforms        = { :ios => '9.0' }

  s.vendored_frameworks = '**/YXArtemis.xcframework'
  s.libraries           = 'z', 'c++', 'resolv'
end
