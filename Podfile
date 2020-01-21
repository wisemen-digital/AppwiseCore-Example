platform :ios, '12.0'

inhibit_all_warnings!

target 'Example Project' do
  project 'Example Project',
    'Development-Debug' => :debug,
    'Development-Release' => :release,
    'Staging-Debug' => :debug,
    'Staging-Release' => :release,
    'Production-Debug' => :debug,
    'Production-Release' => :release

  pod 'AppwiseCore', :path => '../'
  pod 'AppwiseCore/CoreData', :path => '../'
  pod 'AppwiseCore/DeepLink', :path => '../'
  pod 'AppwiseCore/UI', :path => '../'

  # Tools
  pod 'BartyCrouch'
  pod 'Sourcery'
  pod 'SwiftFormat/CLI'
  pod 'SwiftGen'
  pod 'SwiftLint'
  pod 'Bagel'
  pod 'CocoaAsyncSocket'

  # Other
  pod 'BonMot'
  pod 'IQKeyboardManagerSwift'
  pod 'Nuke'
  pod 'Nuke-Alamofire-Plugin'
  pod 'OneSignal'
  pod 'p2.OAuth2'
  pod 'PaginationTracker'
  pod 'Reusable'
  pod 'SnapKit'
  pod 'StatefulUI'
end

# Pods with no defined swift version are set to 4.2
pre_install do |installer|
  installer.analysis_result.specifications.each do |s|
    s.swift_versions << '4.2' if s.swift_versions.empty?
  end
end

# Pre-compile pods
plugin 'cocoapods-rome', {
  :pre_compile => Proc.new { |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
      end
    end
    installer.pods_project.save
  },
  dsym: true,
  configuration: 'Release'
}

post_install do | installer |
  # generate acknowledgements
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
