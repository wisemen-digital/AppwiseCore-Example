platform :ios, '15.0'

inhibit_all_warnings!
ensure_bundler! '> 2.0'
plugin 'cocoapods-alexandria'

def project_common
  project 'Example Project',
  'Development Debug' => :debug, 'Development Release' => :release,
  'Test Debug' => :debug, 'Test Release' => :release,
  'Staging Debug' => :debug, 'Staging Release' => :release,
  'Production Debug' => :debug, 'Production Release' => :release
end

target 'Example Project' do
  project_common

  pod 'AppwiseCore', :path => '../'
  pod 'AppwiseCore/CoreData', :path => '../'
  pod 'AppwiseCore/DeepLink', :path => '../'
  pod 'AppwiseCore/UI', :path => '../'

  # Tools
  unless ENV['CI'].present?
    pod 'atlantis-proxyman'
    pod 'BartyCrouch'
    pod 'Sourcery/CLI-Only'
    pod 'SwiftFormat/CLI'
    pod 'SwiftGen'
    pod 'SwiftLint'
  end

  # Other
  pod 'BonMot'
  pod 'IQKeyboardManagerSwift'
  pod 'Nuke'
  pod 'Nuke-Alamofire-Plugin'
  pod 'OneSignal'
  pod 'p2.OAuth2'
  pod 'Reusable'
  pod 'SnapKit'
  pod 'StatefulUI'
end

target 'Tests' do
  project_common
end

target 'UITests' do
  project_common

  pod 'OHHTTPStubs'
end

# Pods with no defined swift version are set to 4.2
pre_install do |installer|
  installer.pod_targets.select(&:uses_swift?).each do |target|
    target.root_spec.swift_versions << '4.2' if target.root_spec.swift_versions.empty?
    target.instance_variable_set(:@swift_version, '4.2') unless target.swift_version
  end
end

post_install do |installer|
  require 'fileutils'
  FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
