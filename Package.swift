// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TextUtilities",
    products: [
        .library(
            name: "TextUtilities",
            targets: ["TextUtilities"]),
    ],
    targets: [
        .target(
            name: "TextUtilities"),
        .testTarget(
            name: "TextUtilitiesTests",
            dependencies: ["TextUtilities"]
        ),
    ]
)
