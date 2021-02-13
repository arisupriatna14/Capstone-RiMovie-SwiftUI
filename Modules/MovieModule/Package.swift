// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MovieModule",
  platforms: [.iOS(.v14), .macOS(.v10_15), .watchOS(.v7)],
  products: [
    .library(
      name: "MovieModule",
      targets: ["MovieModule"])
  ],
  dependencies: [
    .package(name: "RiMovieCore", url: "https://github.com/arisupriatna14/RiMovie-CoreModule.git", from: "0.0.1"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.1"),
    .package(name: "Realm", url: "https://github.com/realm/realm-cocoa", from: "10.5.0")
  ],
  targets: [
    .target(
      name: "MovieModule",
      dependencies: [
        "RiMovieCore",
        "Alamofire",
        .product(name: "RealmSwift", package: "Realm")
      ]),
    .testTarget(
      name: "MovieModuleTests",
      dependencies: ["MovieModule"])
  ]
)
