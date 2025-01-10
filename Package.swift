// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ButtonStyle",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ButtonStyle",
            targets: ["ButtonStyle"])
    ],
    targets: [
        .target(
            name: "ButtonStyle",
            path: "./Sources/ButtonStyle"
        ),
    ]
)
