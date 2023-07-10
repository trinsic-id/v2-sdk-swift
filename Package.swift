// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Trinsic",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "Trinsic",
            targets: ["Trinsic"]
        ),
    ],
    dependencies: [
        .package(name: "grpc-swift", url: "https://github.com/grpc/grpc-swift.git", from: "1.18.0"),
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf.git", from: "1.21.0"),
    ],
    targets: [
        .target(
            name: "Trinsic",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "SwiftProtobuf", package: "SwiftProtobuf"),
            ]
        ),
        .testTarget(
            name: "TrinsicTests",
            dependencies: ["Trinsic"]
        ),
    ]
)
