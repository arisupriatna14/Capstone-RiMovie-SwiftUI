//
//  AddMovieFavoriteRepositoryTest.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import XCTest
import Combine
import Resolver
@testable import MovieModule

final class AddMovieFavoriteRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository: AddMovieFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieDetailMapper>?
  
  func testExecute() {
    repository?.execute(request: MovieUIModel.stub)
      .sink(receiveCompletion: { _ in }, receiveValue: { (isSuccess) in
        XCTAssertEqual(isSuccess, true)
      })
      .store(in: &cancellables)
  }
  
  static var allTests = [
    ("testExecute", testExecute)
  ]
  
}
