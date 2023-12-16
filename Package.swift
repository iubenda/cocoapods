import PackageDescription

let package = Package(
    name: "IubendaMobileSDK",
    platforms: [
        .iOS(.v10) // or the appropriate platform
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "IubendaMobileSDK",
            targets: ["IubendaMobileSDK"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "IubendaMobileSDK",
            path: "https://libraries.iubenda.com/ios/IubendaMobileSDK/iubenda.xcframework-2.7.1.zip"
        )
    ]
)
