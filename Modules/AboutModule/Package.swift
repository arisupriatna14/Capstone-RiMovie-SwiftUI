// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AboutModule",
  platforms: [.iOS(.v14), .macOS(.v10_15)],
  products: [
    .library(
      name: "AboutModule",
      targets: ["AboutModule"])
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(name: "RiMovieCore", url: "https://github.com/arisupriatna14/RiMovie-CoreModule.git", from: "0.0.1")
  ],
  targets: [
    .target(
      name: "AboutModule",
      dependencies: [
        "RiMovieCore"
      ]),
    .testTarget(
      name: "AboutModuleTests",
      dependencies: ["AboutModule"])
  ]
)
