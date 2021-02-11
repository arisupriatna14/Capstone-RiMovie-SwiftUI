import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(AboutModuleTests.allTests),
    testCase(AboutPresenterTests.allTests),
    testCase(CertificateModelTest.allTests),
    testCase(ClassDicodingModelTest.allTests)
  ]
}
#endif
