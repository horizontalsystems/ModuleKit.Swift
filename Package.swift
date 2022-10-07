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
            .package(url: "https://github.com/horizontalsystems/ComponentKit.Swift.git", .upToNextMajor(from: "1.0.0")),
            .package(url: "https://github.com/horizontalsystems/LanguageKit.Swift.git", .upToNextMajor(from: "1.0.0")),
            .package(url: "https://github.com/horizontalsystems/SectionsTableView.Swift.git", .upToNextMajor(from: "1.0.0")),
            .package(url: "https://github.com/horizontalsystems/UIExtensions.Swift.git", .upToNextMajor(from: "1.0.0")),
        ],
        targets: [
            .target(
                    name: "ModuleKit",
                    dependencies: [
                        .product(name: "ComponentKit", package: "ComponentKit.Swift"),
                        .product(name: "LanguageKit", package: "LanguageKit.Swift"),
                        .product(name: "SectionsTableView", package: "SectionsTableView.Swift"),
                        .product(name: "UIExtensions", package: "UIExtensions.Swift"),
                    ]
            ),
        ]
)
