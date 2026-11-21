require_relative "../../PodConfigs/config_podspec.rb"
require_relative "../../PodConfigs/config_third.rb"
require_relative "../PodConfigs/config_local_common.rb"
require_relative "../PodConfigs/config_local_im.rb"

Pod::Spec.new do |s|
  s.name             = 'NEAdaptiveUIKitOC'
  s.version          = YXConfig.oc_uikit_version
  s.summary          = 'NIM UIKit foldable / adaptive shell (Objective-C).'
  s.homepage         = YXConfig.homepage
  s.license          = YXConfig.license
  s.author           = YXConfig.author
  s.ios.deployment_target = YXConfig.deployment_target

  if YXConfig.use_source_files?
    s.source       = { :git => "" }
    s.source_files = 'NEAdaptiveUIKitOC/Classes/**/*.{h,m}'
    # 内部实现头文件（rail 页面解析、动作转发工具）不进入公共头文件列表。
    s.public_header_files = Dir['NEAdaptiveUIKitOC/Classes/**/*.h'].reject do |path|
      path.end_with?('/NEAdaptiveRailPageNavigation.h') ||
        path.end_with?('/NEAdaptiveRailActionSupport.h') ||
        path.end_with?('/NEAdaptiveUIKitOCInternals.h')
    end
  else
    # 二进制地址由 iOS/skills/im-oc-release 在发布时按上传结果回写（含 NOS 时间戳）。
    s.source = { :http => "https://yx-web-nosdn.netease.im/xkit/IMUIKitOC/10.9.31/1795085441/NEAdaptiveUIKitOC_iOS_v10.9.31.framework.zip?download=NEAdaptiveUIKitOC_iOS_v10.9.31.framework.zip" }
    s.subspec 'NOS' do |nos|
      nos.vendored_frameworks = 'NEAdaptiveUIKitOC.xcframework'
    end

    s.subspec 'NOS_Special' do |nos|
      nos.vendored_frameworks = 'NEAdaptiveUIKitOC.xcframework'
    end

    s.subspec 'FCS' do |fcs|
      fcs.vendored_frameworks = 'NEAdaptiveUIKitOC.xcframework'
    end

    s.subspec 'FCS_Special' do |fcs|
      fcs.vendored_frameworks = 'NEAdaptiveUIKitOC.xcframework'
    end

    s.default_subspecs = 'NOS'
  end

  # 只依赖 Foundation / UIKit：不依赖 NIM SDK、NEChatKit、登录、呼叫或任一皮肤模块。
  s.frameworks = 'UIKit', 'Foundation'

  s.pod_target_xcconfig = {
    "BUILD_LIBRARY_FOR_DISTRIBUTION" => "YES",
    "APPLICATION_EXTENSION_API_ONLY" => "NO",
    "DEBUG_INFORMATION_FORMAT" => "dwarf-with-dsym",
    "CLANG_ENABLE_EXPLICIT_MODULES" => "NO",
    "DEFINES_MODULE" => "YES"
  }
end
