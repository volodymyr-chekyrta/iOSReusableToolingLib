// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReusableToolingLib",
    defaultLocalization: "en",
    platforms: [
        .iOS(
            .v15
        )
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ReusableToolingLib",
            type: .dynamic,
            targets: ["ReusableToolingLib"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.9.1"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.9.1"),
        .package(url: "https://github.com/siteline/swiftui-introspect.git", exact: "1.2.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", exact: "7.9.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ReusableToolingLib",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Swinject", package: "Swinject"),
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ]
        ),
        .testTarget(
            name: "ReusableToolingLibTests",
            dependencies: ["ReusableToolingLib"]
        ),
    ]
)
