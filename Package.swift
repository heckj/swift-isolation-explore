// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-isolation-explore",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Library product for isolation exploration utilities
        .library(
            name: "IsolationExplore",
            targets: ["IsolationExplore"]),
        // Executable product
        .executable(
            name: "IsolationExploreApp",
            targets: ["IsolationExploreApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.4.0"),
    ],
    targets: [
        // Library target with isolation exploration utilities
        .target(
            name: "IsolationExplore",
            dependencies: []),
        // Executable target that uses the library
        .executableTarget(
            name: "IsolationExploreApp",
            dependencies: ["IsolationExplore", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        // Test target
        .testTarget(
            name: "IsolationExploreTests",
            dependencies: ["IsolationExplore"]),
    ]
)
