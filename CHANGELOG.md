# Change Log

All notable changes to this project will be documented in this file.

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
