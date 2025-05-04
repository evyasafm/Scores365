// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Scores365",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]),
        .library(
            name: "Data",
            targets: ["Data"]),
        .library(
            name: "Presentation",
            targets: ["Presentation"]),
        .executable(
            name: "Scores365",
            targets: ["Scores365"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Domain",
            dependencies: []),
        .target(
            name: "Data",
            dependencies: ["Domain"]),
        .target(
            name: "Presentation",
            dependencies: ["Domain", "Data"]),
        .executableTarget(
            name: "Scores365",
            dependencies: ["Domain", "Data", "Presentation"]),
        .testTarget(
            name: "Scores365Tests",
            dependencies: ["Scores365"]),
    ]
) 