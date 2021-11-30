// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Trinsic",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Trinsic",
            targets: ["Services"]),
    ],
    dependencies: [
        .package(name: "grpc-swift", url: "https://github.com/grpc/grpc-swift.git", from: "1.3.0"),
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf.git", from: "1.18.0"),
        .package(name: "Okapi", url: "https://github.com/trinsic-id/okapi-swift.git", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "Services",
            dependencies: [
                .target(name: "Proto"),
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "Okapi", package: "Okapi"),
                .product(name: "SwiftProtobuf", package: "SwiftProtobuf")
            ]),
        .target(
            name: "Proto",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift")
            ]),
        .testTarget(
                name: "TrinsicServicesTests",
                dependencies: ["Services"]),
    ]
)
