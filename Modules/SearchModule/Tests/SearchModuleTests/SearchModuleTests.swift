import XCTest
@testable import SearchModule

final class SearchModuleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SearchModule().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
