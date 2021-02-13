//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Combine
@testable import MovieModule

final class GetMoviesFavoriteRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository: GetMoviesFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieMapper>?
  
  func testExecute() {
    repository?.execute(request: nil)
      .sink(receiveCompletion: { (completion) in
        switch completion {
        case .failure(let error):
          print("Failure with error: \(error.localizedDescription)")
        case .finished:
          print("Finished ⚡️")
        }
      }, receiveValue: { (movies) in
        XCTAssertNotNil(movies)
        XCTAssertEqual(movies[0].id, 0)
      })
      .store(in: &cancellables)
  }
  
  static var allTests = [
    ("testExecute", testExecute)
  ]
  
}
