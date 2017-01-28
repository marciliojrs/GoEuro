source 'https://github.com/CocoaPods/Specs'

platform :ios, '9.0'
use_frameworks!
inhibit_all_warnings!

abstract_target 'GoEuroCommon' do  
  pod 'Alamofire',             '~> 4.2'
  pod 'ObjectMapper',          '~> 2.2'
  pod 'AlamofireObjectMapper', '~> 4.0'

  pod 'Moya',                  '8.0.0-beta.5'
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper',     '~> 2.2'

  pod 'RxSwift',               '~> 3.0'
  pod 'RxCocoa',               '~> 3.0'
  pod 'RxDataSources',         '~> 1.0'
  pod 'NSObject+Rx',           '2.0.0'
  pod 'RxSwiftExt'
  
  pod 'SwiftyColor',           '~> 1.0.0'
  pod 'SwiftDate',             '~> 4.0.7'
  pod 'R.swift',               '~> 3.1.0'

  target 'GoEuro' do
      pod 'XLPagerTabStrip', '~> 6.0'
      pod 'PINRemoteImage'
      pod 'UIImageViewAligned'
      pod 'StatefulViewController'
      pod 'SpringIndicator'
  end

  target 'Tests' do	    
    pod 'Nimble',     '~> 5.1.1'
    pod 'Quick',      '~> 0.10.0'
    pod 'RxBlocking', '~> 3.0.1'
  end
end


# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowledgements.plist", :remove_destination => true)
  end

  installer.pods_project.build_configurations.each do |config|
    config.build_settings['SWIFT_VERSION'] = '3.0'    
  end

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'        
    end
  end
end

