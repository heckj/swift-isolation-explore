// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-isolation-explore",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "IsolationExplore",
            targets: ["IsolationExplore"]),
        .executable(
            name: "IsolationExploreApp",
            targets: ["IsolationExploreApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.4.0"),
    ],
    targets: [
        .target(
            name: "IsolationExplore",
            dependencies: []),
        .executableTarget(
            name: "IsolationExploreApp",
            dependencies: ["IsolationExplore", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "IsolationExploreTests",
            dependencies: ["IsolationExplore"]),
    ]
)
