// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IubendaSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .tvOS(.v15),
    ],
    products: [
        .library(
            name: "IubendaSDK",
            targets: ["IubendaSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "IubendaSDK",
            path: "iubenda.xcframework"
        )
    ]
)
