// swift-tools-version: 5.8
//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftRTC open source project
//
// Copyright (c) 2024 ngRTC and the SwiftRTC project authors
// Licensed under MIT License
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftRTC project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "swift-rtc-examples",
    // minimal version align with swift-hash
    platforms: [
        .macOS("13.3"),
        .iOS("16.4"),
        .watchOS("9.4"),
        .tvOS("16.4"),
    ],
    products: [],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/ngr-tc/swift-rtc.git", branch: "master"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),
        .package(url: "https://github.com/swift-extras/swift-extras-base64.git", from: "1.0.0"),
    ],
    targets: [
        // MARK: - Targets

        // MARK: - Tests

        // MARK: - Examples
        .executableTarget(name: "XExampleStunClient",
            dependencies: [
                .product(name: "STUN", package: "swift-rtc"),
                .product(name: "Shared", package: "swift-rtc"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
            ]
        ),
        .executableTarget(name: "XExampleStunDecode",
            dependencies: [
                .product(name: "STUN", package: "swift-rtc"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "ExtrasBase64", package: "swift-extras-base64"),
            ]
        ),
    ]
)
