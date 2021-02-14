//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Combine
@testable import MovieModule

final class GetMovieRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository: GetMovieRepository<FakeGetMovieRemoteDataSource, MovieDetailMapper>?
  
  func testExecute() {
    repository?.execute(request: 0)
      .sink(receiveCompletion: { (_) in }, receiveValue: { (movie) in
        XCTAssertEqual(movie.id, 0)
      })
      .store(in: &cancellables)
    
  }

  static var allTests = [
    ("testExecute", testExecute)
  ]

}
