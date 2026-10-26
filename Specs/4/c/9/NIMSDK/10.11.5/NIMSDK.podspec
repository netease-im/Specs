Pod::Spec.new do |s|   
 s.name = 'NIMSDK'     
 s.version = '10.11.5'
 s.summary = 'Netease IM SDK'
 s.homepage = 'http://netease.im'
 s.license = { :'type' => 'Copyright', :'text' => ' Copyright 2026 Netease '}
 s.authors = 'Netease IM Team'  
 s.source = { :http => 'https://yx-web-nosdn.netease.im/package/1792482194857/NIM_iOS_SDK_v10.11.5_764a939.zip'}
 s.platform = :ios, '9.0'
 s.frameworks = 'SystemConfiguration', 'AVFoundation', 'CoreTelephony', 'AudioToolbox', 'CoreMedia' , 'VideoToolbox'  
 s.libraries = 'sqlite3.0', 'z', 'c++', 'resolv' 
 s.resources  = '**/Resources/NMCVideoFilter.bundle'

   
 s.default_subspec = 'NOS'
   
 s.subspec 'NOS' do |nos|
   nos.vendored_frameworks = '**/NIMSDK.xcframework','**/NIMSocketRocket.xcframework','**/NIMQuic.xcframework','**/NIMAVChat.xcframework','**/NIMDBEx.xcframework','**/NMC.xcframework','**/NMCBasicModuleFramework.xcframework', '**/NIMHA.xcframework'
 end

 s.subspec 'FCS' do |fcs|
    fcs.vendored_frameworks = '**/NIMSDK.xcframework','**/NIMSocketRocket.xcframework','**/NIMQuic.xcframework','**/NIMAVChat.xcframework','**/NIMDBEx.xcframework','**/NMC.xcframework','**/NMCBasicModuleFramework.xcframework', '**/NIMHA.xcframework', '**/NIMAWSCore.xcframework', '**/NIMAWSS3.xcframework'
  end

 s.subspec 'BASE' do |base|
    base.vendored_frameworks = '**/NIMSDK.xcframework','**/NIMSocketRocket.xcframework','**/NIMQuic.xcframework','**/NIMAVChat.xcframework','**/NMC.xcframework','**/NMCBasicModuleFramework.xcframework', '**/NIMHA.xcframework'
 end

  s.subspec 'QChat' do |qchat|
    qchat.vendored_frameworks = '**/NIMQChat.xcframework'
 end

 s.dependency 'YXArtemis_XCFramework'
end   

