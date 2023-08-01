// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PayseraBlacklistSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "PayseraBlacklistSDK", targets: ["PayseraBlacklistSDK"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/paysera/swift-lib-common-sdk",
            from: "4.3.0"
        )
    ],
    targets: [
        .target(
            name: "PayseraBlacklistSDK",
            dependencies: [
                .product(name: "PayseraCommonSDK", package: "swift-lib-common-sdk")
            ]
        ),
        .testTarget(
            name: "PayseraBlacklistSDKTests",
            dependencies: ["PayseraBlacklistSDK"]
        ),
    ]
)
