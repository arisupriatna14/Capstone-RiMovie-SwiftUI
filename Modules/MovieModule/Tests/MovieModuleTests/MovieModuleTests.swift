import XCTest
@testable import MovieModule

final class MovieModuleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MovieModule().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
