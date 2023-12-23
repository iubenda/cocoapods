Pod::Spec.new do |s|
    s.name         = 'IubendaMobileSDK'
    s.version      = '2.7.2'
    s.summary      = 'Iubenda SDK'
    s.homepage     = 'https://iubenda.com'
    s.license      = { :type => 'Copyright', :text => 'Copyright (C) Iubenda srl'  }
    s.author       = { 'iubenda' => 'info@iubenda.com' }
    s.source       = { :http => 'https://libraries.iubenda.com/ios/IubendaMobileSDK/iubenda.xcframework-2.7.2.zip' }
    s.pod_target_xcconfig = { 'INFOPLIST_FILE' => '$(POD_TARGET_SRCROOT)/Info.plist' }
    s.vendored_frameworks = 'iubenda.xcframework'
    s.swift_version = '5'
    s.ios.deployment_target  = '10.0'
    s.tvos.deployment_target  = '10.0'
end
