require 'fileutils'
require './../Scripts/cocoapods_rome.rb'

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
  installer.analysis_result.specifications.each do |s|
    s.swift_versions << '4.2' if s.swift_versions.empty?
  end
end

# Pre-compile pods
plugin 'cocoapods-rome',
  :pre_compile => Proc.new { |installer|
    # fix interface builder
    interface_builder_integration(installer)

    # ensure we have bitcode
    force_bitcode(installer)
  },
  :post_compile => Proc.new { |installer|
    # generate project
    generate_project(installer)

    # generate acknowledgements
    FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
  },
  :dsym => true,
  :configuration => 'Release'
