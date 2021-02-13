//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Combine
@testable import MovieModule

final class UpdateMovieFavoriteRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository: UpdateMovieFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieDetailMapper>?
  
  func testExecute() {
    repository?.execute(request: 0)
      .sink(receiveCompletion: { (completion) in
        switch completion {
        case .failure(let error):
          print("Failure with error: \(error.localizedDescription)")
        case .finished:
          print("Finished ⚡️")
        }
      }, receiveValue: { (movie) in
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.id, 0)
      })
      .store(in: &cancellables)
  }
  
  static var allTests = [
    ("testExecute", testExecute)
  ]
  
}
