// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ModuleKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ModuleKit",
            targets: ["ModuleKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/horizontalsystems/UIExtensions.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/horizontalsystems/SectionsTableView.git", .upToNextMajor(from: "1.1.1")),
        .package(url: "https://github.com/horizontalsystems/ComponentKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/horizontalsystems/LanguageKit.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .target(
            name: "ModuleKit",
            dependencies: ["UIExtensions", "SectionsTableView", "ComponentKit", "LanguageKit"]),
    ]
)
