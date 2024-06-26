// swift-tools-version:5.10

import PackageDescription

let package = Package(
	name: "Example Project",
	dependencies: [
		.package(url: "https://github.com/shibapm/Komondor.git", exact: "1.1.3")
	],
	targets: [
		// This is just an arbitrary Swift file in the app, that has
		// no dependencies outside of Foundation
		.target(
			name: "example-project",
			dependencies: [],
			path: "Application/Sources/Helpers",
			sources: ["AppDelegate.swift"]
		)
	]
)

#if canImport(PackageConfig)
import PackageConfig

let config = PackageConfiguration([
	"komondor": [
		"pre-commit": [
			"./Pods/SwiftFormat/CommandLineTool/swiftformat .",
			"./Pods/SwiftLint/swiftlint --fix --quiet"
		]
	]
]).write()
#endif
