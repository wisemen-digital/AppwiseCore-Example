platform :ios, '11.0'

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
	pod 'Bagel', :modular_headers => true, :configurations => ['Development-Debug', 'Staging-Debug', 'Production-Debug']
	pod 'CocoaAsyncSocket', :modular_headers => true, :configurations => ['Development-Debug', 'Staging-Debug', 'Production-Debug']

	# Other
	pod 'BonMot'
	pod 'Crashlytics'
	pod 'IQKeyboardManagerSwift'
	pod 'Nuke'
	pod 'Nuke-Alamofire-Plugin'
	pod 'OneSignal'
	pod 'p2.OAuth2'
	pod 'PaginationTracker'
	pod 'Reusable'
	pod 'SnapKit'
	pod 'StatefulUI'

	# Scripts
	script_phase :name => 'Check Strings',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/BartyCrouch/bartycrouch" update -x;"${PODS_ROOT}/BartyCrouch/bartycrouch" lint -x'

	script_phase :name => 'SwiftGen',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/SwiftGen/bin/swiftgen"'

	script_phase :name => 'Sourcery',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/Sourcery/bin/sourcery"'

	script_phase :name => 'SwiftFormat',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/SwiftFormat/CommandLineTool/swiftformat" .'

	script_phase :name => 'SwiftLint',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/SwiftLint/swiftlint" lint --config "${PROJECT_DIR}/.swiftlint.yml" --path "${PROJECT_DIR}"'

	script_phase :name => 'Update Version Number',
		:execution_position => :after_compile,
		:script => '"../Scripts/update_build_number.sh"'

	script_phase :name => 'Fabric',
		:execution_position => :after_compile,
		:script => '"${PODS_ROOT}/Fabric/run" 0000000000000000000000000000000000000000 0000000000000000000000000000000000000000000000000000000000000000'
end

post_install do | installer |
	# Silence Xcode warnings about low deployment targets
	installer.generated_projects.each do |project|
		project.build_configurations.each do |config|
			config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0' if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
		end
		project.targets.each do |target|
			target.build_configurations.each do |config|
				config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0' if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
			end
		end
	end

	# generate acknowledgements
	require 'fileutils'
	FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
