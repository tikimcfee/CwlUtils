// swift-tools-version:5.0
import PackageDescription

let package = Package(
	name: "CwlUtils",
   products: [
   	.library(name: "CwlUtils", targets: ["CwlUtils"]),
		.library(name: "CwlFrameAddress", targets: ["CwlFrameAddress"]),
	],
	dependencies: [
		.package(url: "file:///Users/matt/Projects/CwlPreconditionTesting", .branch("master")),
	],
	targets: [
		.target(
			name: "CwlUtils",
			dependencies: [
				.target(name: "CwlFrameAddress"),
				.target(name: "ReferenceRandomGenerators"),
			]
		),
		.target(name: "CwlFrameAddress"),
		.target(name: "ReferenceRandomGenerators"),
		.testTarget(
			name: "CwlUtilsTests",
			dependencies: [
				.target(name: "CwlUtils"),
				.product(name: "CwlPreconditionTesting")
			]
		),
	]
)
