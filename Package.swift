// swift-tools-version: 5.9
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
    targets: [
        // Library target with isolation exploration utilities
        .target(
            name: "IsolationExplore",
            dependencies: []),
        // Executable target that uses the library
        .executableTarget(
            name: "IsolationExploreApp",
            dependencies: ["IsolationExplore"]),
    ]
)
