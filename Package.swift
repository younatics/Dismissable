// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "Dismissable",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Dismissable", targets: ["Dismissable"])
    ],
    targets: [
        .target(
            name: "Dismissable",
            path: "Dismissable",
            exclude: [
                "Dismissable.h",
                "Info.plist"
            ],
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        ),
        .testTarget(
            name: "DismissableTests",
            dependencies: ["Dismissable"],
            path: "Tests/DismissableTests",
            swiftSettings: [
                .swiftLanguageMode(.v6)
            ]
        )
    ]
)
