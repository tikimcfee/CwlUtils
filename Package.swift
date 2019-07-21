// swift-tools-version:5.0
import PackageDescription

let package = Package(
	name: "CwlUtils",
   products: [
   	.library(name: "CwlUtils", type: .dynamic, targets: ["CwlUtils"]),
		.library(name: "CwlFrameAddress", targets: ["CwlFrameAddress"]),
	],
	dependencies: [
		.package(url: "https://github.com/mattgallagher/CwlPreconditionTesting.git", from: Version(2, 0, 0, prereleaseIdentifiers: ["-beta.1"]))
	],
	targets: [
		.target(
			name: "CwlUtils",
			dependencies: [
				.target(name: "CwlFrameAddress"),
			]
		),
		.target(name: "CwlFrameAddress"),
		.target(name: "ReferenceRandomGenerators"),
		.testTarget(
			name: "CwlUtilsTests",
			dependencies: [
				.target(name: "CwlUtils"),
				.target(name: "ReferenceRandomGenerators"),
				.product(name: "CwlPreconditionTesting")
			]
		),
		.testTarget(
			name: "CwlUtilsPerformanceTests",
			dependencies: [
				.target(name: "CwlUtils"),
				.target(name: "ReferenceRandomGenerators")
			]
		)
	]
)
