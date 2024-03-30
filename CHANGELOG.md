# Change Log

All notable changes to this project will be documented in this file.

## 30 March 2024

* Update dependencies (gems, cocoapods), including OneSignal 5.

## 28 March 2024

* Add privacy manifest file.

## 11 Januari 2024

* Add custom podspec repo.
* Update dependencies (gems, cocoapods).

## 19 July 2023

* Fastlane: update Sentry organisation (URL slug) to wisemen.
* Network: fix race condition in session initialization.
* SwiftLint: disable annoying "else" rule.
* Update dependencies (gems, cocoapods).

## 26 April 2022

* Update to latest Swift 5.8 & Xcode 14.3.
* Update dependencies (gems, cocoapods).
* Update copyright to 2023 Wisemen.
* Komondor: set to fixed version 1.1.3.
* Update SwiftLint ruleset to opt-out (instead of opt-in).
* Translations: make sure we work with `Base` files everywhere.

## 12 October 2022

* Xcode 14 compatibility (remove bitcode, update Alexandria)
* Fastlane: avoid issues when there are multiple targets (such as extensions)
* Update dependencies (spm, gems, cocoapods).

## 5 July 2022

* Update bitrise config.
* Update dependencies (spm, gems, cocoapods).
* Avoid installing tooling on CI.
* Restructure XcodeGen project definition a bit.

### 01 February 2022

* Update bootstrap script to use AppwiseCore version 2.0.

### 26 January 2022

* Update bitrise config.
* Update dependencies (spm, gems, cocoapods).

### 19 May 2021

* Upgrade xcodegen (on CI).

### 6 May 2021

* Upgrade to Sentry 7, and configure a trace sample rate.
* Upgrade xcodegen (on CI).

### 17 March 2021

* Switch from Bagel to Proxyman.
* Added a Test environment (next to dev/stg/prd).
* Fix swiftlint commit hook.

### 18 February 2021

* Update libraries.
* Smarter CI cache (now that we use alexandria).

### 03 January 2021

* Switch from CocoaPods Rome to Alexandria.

### 16 December 2020

* Update libraries, inculding new OneSignal init. code.

### 24 November 2020

* Update min. iOS version to 13.
* Fastlane: fix scheme names.
* Slightly faster simulator debug builds.
* Configure a simpler common file header.

### 23 October 2020

* Bootstrap: fix issue with Komondor/initial commit.
* Add a template bitrise configuration.

### 12 October 2020

* Fastlane: replace the import/export lanes with one `sync_translations` lane.

### 29 September 2020

* Fixed the default user repository (missing context).
* Add a sample issuetracker file (for Jira integration).
* Updated Swiftlint (new rules), SwiftFormat (some options) and SwiftGen (support for stringsdict).
* Add an entitlements file to silence warnings from appstoreconnect.
* Move app version to settings.xcconfig file.
* Add permission and protocol to info.plist so that Bagel works on iOS 14.

### 1 July 2020

* Better Podfile/Fastlane integration for on CI and local builds. This ensures that local builds use a `debug` configuration, whereas CI builds will use `release` configuration.
* Use swift 5 templates from SwiftGen 6.2.
* Update Sentry client code.

### 17 June 2020

* Some fixes for bootstrap script (path issues).

### 7 May 2020

* Update Sentry client code.
* Update Rome usage code in Podfile.
* Re-work settings config structure.
* Add file lists for quicker build phases.
* Add commit hooks for running swiftformat & lint autocorrect.

### 19 March 2020

* Exclude Rome directory from SwiftLint.

### 11 March 2020

* Use Sentry environment variable for configuring fastlane.

### 20 February 2020

* Update swiftlint config to ignore Rome folder.

### 17 February 2020

* Use new rome integration script that includes IB fixes.

### 28 January 2020

* Add fastlane actions from AppwiseCore.
* Some fixes for bootstrap script (path issues).
* Link commits to sentry release.

### 21 January 2020

* Update SwiftFormat to 0.44 (with some configuration changes).
* Latest SwiftLint 0.38.2 rules.
* Replace Crashlytics/Fabric with Sentry:
  * Change dependency in Podfile.
  * Replace application service (and update application delegate).
  * Remove Info.plist key.
  * Remove Fabric build step.
  * Update fastlane `Appfile` & `Fastfile`
* Use appwise-core built-in build step scripts.
* Switch to Cocoapods Rome for much faster build times.
  * Note: this requires an additional build step "Strip Architectures" for release builds.
  * Warning: some (badly) configured pods need you to add loose resources from the 'Rome' directory to work correctly.
* Use XcodeGen to generate project.
  * This uses the `iOS App` target template provided within AppwiseCore, which includes most common steps.

### 15 November 2019

* Re-add some code to network retrier to avoid authentication loops.

### 6 November 2019

* Some fixes to bootstrap script, and add an initialize git step.
* Gitignore .DS_Store files.
* Removed the pre-set development team.

### 5 November 2019

* Add a check to the network request retrier to see if the session expired.
* Add an example of the efficient startup flow (skip load if we have local data).
* Set the min. iOS version to 12.4.

### 4 November 2019

* CocoaPods 1.8.
* SwiftLint 0.36 with some new rules.
* Ignore certificate files for Git.

### 2 July 2019

* Split up asset catalog into one for images and one for style (colors). Also get rid of old `Colors.json` file. Updated SwiftGen accordingly.
* Switch to BartyCrouch instead of LocalizableCheck.
* Add SwiftFormat to ensure styling is the same everywhere.
* Add Bagel for easier network debugging.
* CocoaPods 1.7 with a CDN source (for quicker installs/updates).
* SwiftLint 0.33 with new rules.
* Add a CoreData application service with some sample transformers.
* Update the keyboard application service to only enable IQKeyboardManager in specific view controllers.
* Add push handling example code.
* Set Swift version to 5.0.
* Use new CoreData SwiftGen templates.
* Use new `Identifiable` protocol.
* Move view models into `ViewModel` namespace.
* Example of user-scoped settings.
* Move OAuth2 grant into it's own file.
* Add an example hack file.
* Add an example user repository.
* Add some example formatters.
* Add an extension to easily present an error.
* Add some permission keys to the `Info.plist`, the contacts one fixes a sporadic crash when creating an event.
* Add a styling application service.
* Add `StatefulUI` and `PaginationTracker` as dependencies.

### 10 March 2019

* Generate Core Data files using SwiftGen.
* Tweaked SwiftLint rules.
* Use a Sourcery config file (instead of a bunch of parameters).
* Added `AutoModel.generated.swift`.

### 12 January 2019

* New SwiftLint rules.
* Drop iOS 10 by default.

### 15 November 2018

* New SwiftLint rules.
* Add a small fix for warnings due to pods with no (or old) deployment targets.

### 11 October 2018

* Removed spaces from the configurations and schemes' names, to avoid an Xcode path bug.
* Upgraded to Swift 4.2, and added an exception to the Podfile for older libraries.

### 2 October 2018

* SwiftGen: Remove input/output paths from SwiftGen build step, to ensure it always runs.
* SwiftGen: Update to 6.0.0, split up the generated storyboard files.
* SwiftLint: Add rules to enforce SwiftGen use.

### 24 July 2018

* APIClient: Removed `ServerError` and `extract(from:error:)` as these are built-in now.

### 9 July 2018

* New SwiftLint rules.
* Updated for latest Nuke changes.

### 5 July 2018

* Refactored the Fastfile a bit for better maintainability.

### 30 April 2018

* Added fastlane configuratione example.
* Bootstrap script now also configures the app identifier and the user's apple ID.

### 26 April 2018

* Build phases: disable sourcery during archive, otherwise it keeps resetting the generated code.
* Updated release `xcconfig`s to use the new SWIFT_COMPILATION_MODE setting.

### 27 February 2018

* Enable some extra warnings in Settings.xcconfig.
