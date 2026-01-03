# Swift Isolation Exploration

A Swift package for exploring concurrency isolation concepts including actors, global actors (MainActor), and Sendable conformance.

## Overview

This package provides a library and an executable target for exploring and demonstrating Swift's concurrency isolation features:

- **IsolationExplore** - A library module with utilities for exploring isolation concepts
- **IsolationExploreApp** - An executable that demonstrates various isolation scenarios

## Features

- **Actor Isolation**: Demonstrates how actors provide isolation for mutable state
- **MainActor Isolation**: Shows global actor isolation patterns
- **Sendable Types**: Examples of Sendable conformance for safe concurrent data sharing
- **Concurrency Examples**: Practical demonstrations using structured concurrency

## Building and Running

### Build the Package

```bash
swift build
```

### Run the Executable

```bash
swift run IsolationExploreApp
```

### Use as a Library

Add this package as a dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/heckj/swift-isolation-explore.git", from: "1.0.0")
]
```

## Requirements

- Swift 5.9 or later
- macOS 13.0 or later

## Project Structure

```
swift-isolation-explore/
├── Package.swift
└── Sources/
    ├── IsolationExplore/
    │   └── IsolationExplore.swift
    └── IsolationExploreApp/
        └── main.swift
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.
