import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(MovieModuleTests.allTests),
    testCase(AddMovieFavoriteRepositoryTest.allTests),
    testCase(GetMovieFavoriteRepositoryTest.allTests),
    testCase(GetMovieRepositoryTest.allTests),
    testCase(GetMoviesFavoriteRepositoryTest.allTests),
    testCase(GetMovieSimilarRepositoryTest.allTests),
    testCase(GetMoviesRepositoryTest.allTests),
    testCase(UpdateMovieFavoriteRepositoryTest.allTests),
    testCase(MoviesPresenterTest.allTests)
  ]
}
#endif
