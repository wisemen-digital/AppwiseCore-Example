platform :ios, '10.0'

inhibit_all_warnings!
use_frameworks!

target 'Example' do
	project 'Example',
		'Development (Debug)' => :debug,
		'Development (Release)' => :release,
		'Staging (Debug)' => :debug,
		'Staging (Release)' => :release,
		'Production (Debug)' => :debug,
		'Production (Release)' => :release

	pod 'AppwiseCore'
	pod 'AppwiseCore/CoreData'
	pod 'AppwiseCore/DeepLink'
	pod 'AppwiseCore/UI'

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
		:input_files => ['${SRCROOT}/Application/Resources'],
		:output_files => ['${SRCROOT}/Application/Sources/Generated/SwiftGen/*'],
		:script => '"${PODS_ROOT}/SwiftGen/bin/swiftgen"'

	script_phase :name => 'Sourcery',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/Sourcery/bin/sourcery" --sources "${SRCROOT}/Application/Sources" --sources "$DERIVED_SOURCES_DIR" --templates "${PODS_ROOT}/AppwiseCore/Sourcery" --output "${SRCROOT}/Application/Sources/Generated/Sourcery"'

	script_phase :name => 'SwiftLint',
		:execution_position => :before_compile,
		:script => '"${PODS_ROOT}/SwiftLint/swiftlint" lint --config "${PROJECT_DIR}/.swiftlint.yml" --path "${PROJECT_DIR}"'

	script_phase :name => 'Update Version Number',
		:execution_position => :after_compile,
		:script => '"${PODS_ROOT}/AppwiseCore/Scripts/update_build_number.sh"'

	script_phase :name => 'Fabric',
		:execution_position => :after_compile,
		:script => '"${PODS_ROOT}/Fabric/run" 0000000000000000000000000000000000000000 0000000000000000000000000000000000000000000000000000000000000000'
end

post_install do | installer |
	require 'fileutils'

	# generate acknowledgements
	FileUtils.cp_r('Pods/Target Support Files/Pods-Example/Pods-Example-Acknowledgements.plist', 'Application/Resources/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end
