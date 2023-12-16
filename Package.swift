// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "IubendaMobileSDK",
    platforms: [
        .iOS(.v12) // or the appropriate platform
    ],
    products: [
        .library(
            name: "IubendaMobileSDK",
            targets: ["IubendaMobileSDK"]),
    ],
    targets: [
        .binaryTarget(
            name: "IubendaMobileSDK",
            path: "https://libraries.iubenda.com/ios/IubendaMobileSDK/iubenda.xcframework-2.7.1.zip"
        )
    ]
)
