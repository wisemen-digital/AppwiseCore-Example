# Change Log

All notable changes to this project will be documented in this file.

### 11 October 2018

* Removed spaces from the configurations and schemes' names, to avoid an Xcode path bug.

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
