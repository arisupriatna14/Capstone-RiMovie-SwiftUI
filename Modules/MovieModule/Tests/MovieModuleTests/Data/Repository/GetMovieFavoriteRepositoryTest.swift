//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import XCTest
import Resolver
import Combine
@testable import MovieModule

final class GetMovieFavoriteRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository: GetMovieFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieDetailMapper>?

  func testExecute() {
    repository?.execute(request: MovieModel.stub.id)
      .sink(receiveCompletion: { _ in }) { (movie) in
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie.id, 0)
      }
      .store(in: &cancellables)
  }
  
  static var allTests = [
    ("testExecute", testExecute)
  ]
  
}
