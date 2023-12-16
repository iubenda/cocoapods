// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IubendaMobileSDK",
    defaultLocalization: "en",
    platforms: [
           .iOS(.v12), // or the appropriate platform
           .tvOS(.v12) // or the appropriate platform
       ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IubendaMobileSDK",
            targets: ["IubendaMobileSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "IubendaMobileSDK",
            path: "sdk"
        ),
    ]
)
