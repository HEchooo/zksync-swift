// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZKSync",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ZKSync",
            targets: [
                "ZKSync"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/HEchooo/web3swift.git", from: "2.7.2"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.7.1")
    ],
    targets: [
        .target(
            name: "ZKSync",
            dependencies: [
                "ZKSyncCrypto",
                .product(name: "web3swift", package: "Web3swift"),
                "Alamofire"
            ],
            path: "Sources/ZKSync"),
        .binaryTarget(
            name: "ZKSyncCrypto",
            path: "Dependencies/ZKSyncCrypto.xcframework"),
    ]
)
