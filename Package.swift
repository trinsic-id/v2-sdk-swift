// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Trinsic",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "Trinsic",
            targets: ["Trinsic", "Connect"]
        ),
    ],
    dependencies: [
        .package(name: "grpc-swift", url: "https://github.com/grpc/grpc-swift.git", from: "1.19.0"),
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf.git", from: "1.22.1"),
        .package(name: "AppAuth", url: "https://github.com/openid/AppAuth-iOS.git", .upToNextMajor(from: "1.6.2"))
    ],
    targets: [
        .target(
            name: "Trinsic",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "SwiftProtobuf", package: "SwiftProtobuf"),
            ]
        ),
        .target(
            name: "Connect",
            dependencies: [
                .product(name: "AppAuth", package: "AppAuth"),
            ]
        ),
        .testTarget(
            name: "TrinsicTests",
            dependencies: ["Trinsic"]
        ),
    ]
)
