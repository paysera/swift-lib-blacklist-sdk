// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PayseraBlacklistSDK",
    platforms: [.macOS(.v10_12), .iOS(.v10), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(name: "PayseraBlacklistSDK", targets: ["PayseraBlacklistSDK"]),
    ],
    dependencies: [
        .package(name: "PayseraCommonSDK", url: "https://github.com/paysera/swift-lib-common-sdk", from: "4.0.0")
    ],
    targets: [
        .target(
            name: "PayseraBlacklistSDK",
            dependencies: ["PayseraCommonSDK"]
        ),
        .testTarget(
            name: "PayseraBlacklistSDKTests",
            dependencies: ["PayseraBlacklistSDK"]
        ),
    ]
)
