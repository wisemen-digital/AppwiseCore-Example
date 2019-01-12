platform :ios, '10.0'

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
	pod 'LocalizableCheck'
	pod 'Sourcery'
	pod 'SwiftGen'
	pod 'SwiftLint'

	# Other
	pod 'BonMot'
	pod 'Crashlytics'
	pod 'IQKeyboardManagerSwift'
	pod 'Nuke'
	pod 'Nuke-Alamofire-Plugin'
	pod 'OneSignal'
	pod 'p2.OAuth2'
	pod 'Reusable'
	pod 'SnapKit'

	# Scripts
	script_phase :name => 'Check Strings',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/LocalizableCheck/bin/LocalizableCheck" "${SRCROOT}/Application/Resources"'

	script_phase :name => 'SwiftGen',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/SwiftGen/bin/swiftgen"'

	script_phase :name => 'Sourcery',
		:execution_position => :before_compile,
		:script => 'if [ $ACTION != "install" ]; then "${PODS_ROOT}/Sourcery/bin/sourcery" --sources "${SRCROOT}/Application/Sources" --sources "$DERIVED_SOURCES_DIR" --templates "../Sourcery" --output "${SRCROOT}/Application/Sources/Generated/Sourcery"; fi'

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
    require 'fileutils'

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            # Silence Xcode warnings about low deployment targets
            if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
            end
        end
    end

    # generate acknowledgements
    FileUtils.cp_r('Pods/Target Support Files/Pods-Example Project/Pods-Example Project-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
