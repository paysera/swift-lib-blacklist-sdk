// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "PayseraBlacklistSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "PayseraBlacklistSDK", targets: ["PayseraBlacklistSDK"]),
    ],
    dependencies: [
        .package(
            name: "PayseraCommonSDK",
            url: "https://github.com/paysera/swift-lib-common-sdk",
            .branch("xcode13")
        )
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
