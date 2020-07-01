raise 'Please use bundle exec to run the pod command' unless defined?(Bundler)

platform :ios, '12.0'

target 'Example Project' do
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
  installer.pod_targets.select(&:uses_swift?).each do |target|
    target.root_spec.swift_versions << '4.2' if target.root_spec.swift_versions.empty?
    target.instance_variable_set(:@swift_version, '4.2') unless target.swift_version
  end
end

# Pre-compile pods
plugin 'cocoapods-rome',
  :post_compile => Proc.new { |installer|
    # generate project
    require './../Scripts/cocoapods_rome.rb'
    generate_project(installer) unless ENV.key?('CI')

    # generate acknowledgements
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
  },
  :dsym => !ENV.key?('CI'),
  :configuration => ENV.key?('CI') ? 'Release' : 'Debug',
  :fix_interface_builder => true,
  :force_bitcode => true
