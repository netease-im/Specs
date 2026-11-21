require_relative "../../PodConfigs/config_podspec.rb"
require_relative "../../PodConfigs/config_third.rb"
require_relative "../PodConfigs/config_local_common.rb"
require_relative "../PodConfigs/config_local_im.rb"

Pod::Spec.new do |s|
  s.name             = 'NEBaseUIKitOC'
  s.version          = YXConfig.oc_uikit_version
  s.summary          = 'NIM UIKit common UI base components (Objective-C).'
  s.homepage         = YXConfig.homepage
  s.license          = YXConfig.license
  s.author           = YXConfig.author
  s.ios.deployment_target = YXConfig.deployment_target

  if YXConfig.use_source_files?
    s.source       = { :git => "" }
    s.source_files = 'NEBaseUIKitOC/Classes/**/*.{h,m}'
    s.exclude_files = [
      'NEBaseUIKitOC/Classes/Core/Extension/Constant.h',
      'NEBaseUIKitOC/Classes/Base/BaseViewController/NEBaseTableViewController.h',
      'NEBaseUIKitOC/Classes/Base/BaseViewController/NEBaseViewController.h',
      'NEBaseUIKitOC/Classes/CommonView/NEEmptyDataView.h',
      'NEBaseUIKitOC/Classes/CommonViewController/NENavigationController.h',
    ]
    s.public_header_files = Dir['NEBaseUIKitOC/Classes/**/*.h'].reject do |path|
      path.include?('/Vender/KeyboardManager/Categories/') ||
      path.end_with?('/Classes/Core/Extension/Constant.h') ||
      path.end_with?('/Classes/Base/BaseViewController/NEBaseTableViewController.h') ||
      path.end_with?('/Classes/Base/BaseViewController/NEBaseViewController.h') ||
      path.end_with?('/Classes/CommonView/NEEmptyDataView.h') ||
      path.end_with?('/Classes/CommonViewController/NENavigationController.h')
    end
    s.resource     = 'NEBaseUIKitOC/Assets/**/*'

    s.dependency NEChatKit.name, NEChatKit.version
    s.dependency SDWebImage.name, SDWebImage.version
    s.dependency LottieOC.name, LottieOC.version
  else
    s.source = { :http => "https://yx-web-nosdn.netease.im/xkit/IMUIKitOC/10.9.31/1795085441/NEBaseUIKitOC_iOS_v10.9.31.framework.zip?download=NEBaseUIKitOC_iOS_v10.9.31.framework.zip" }
    s.subspec 'NOS' do |nos|
      nos.vendored_frameworks = 'NEBaseUIKitOC.xcframework'
      nos.dependency NEChatKit.NOS, NEChatKit.version
      nos.dependency SDWebImage.name, SDWebImage.version
      nos.dependency LottieOC.name, LottieOC.version
    end

    s.subspec 'NOS_Special' do |nos|
      nos.vendored_frameworks = 'NEBaseUIKitOC.xcframework'
      nos.dependency NEChatKit.NOS_Special, NEChatKit.version
      nos.dependency SDWebImage.name, SDWebImage.version
      nos.dependency LottieOC.name, LottieOC.version
    end

    s.subspec 'FCS' do |fcs|
      fcs.vendored_frameworks = 'NEBaseUIKitOC.xcframework'
      fcs.dependency NEChatKit.FCS, NEChatKit.version
      fcs.dependency SDWebImage.name, SDWebImage.version
      fcs.dependency LottieOC.name, LottieOC.version
    end

    s.subspec 'FCS_Special' do |fcs|
      fcs.vendored_frameworks = 'NEBaseUIKitOC.xcframework'
      fcs.dependency NEChatKit.FCS_Special, NEChatKit.version
      fcs.dependency SDWebImage.name, SDWebImage.version
      fcs.dependency LottieOC.name, LottieOC.version
    end

    s.default_subspecs = 'NOS'
  end

  s.frameworks = 'UIKit', 'Foundation'

  s.pod_target_xcconfig = {
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "APPLICATION_EXTENSION_API_ONLY" => "NO",
    "DEBUG_INFORMATION_FORMAT" => "dwarf-with-dsym",
    "CLANG_ENABLE_EXPLICIT_MODULES" => "NO",
    "DEFINES_MODULE" => "YES",
    "SWIFT_INSTALL_OBJC_HEADER" => "YES",
    "SWIFT_OBJC_INTERFACE_HEADER_NAME" => "$(PRODUCT_MODULE_NAME)-Swift.h",
    "HEADER_SEARCH_PATHS" => '$(inherited) "${PODS_TARGET_SRCROOT}/NEBaseUIKitOC/Classes/Vender/Toast"'
  }
end
