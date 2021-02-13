//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Combine
import Resolver
@testable import MovieModule

final class GetMoviesRepositoryTest: XCTestCase {
  
  private var cancellables: Set<AnyCancellable> = []
  private var repository = GetMoviesRepository<FakeGetMoviesRemoteDataSource, MovieMapper>(remote: Resolver.resolve(), mapper: MovieMapper())
  
  func testExecuteMovieNowPlaying() {
    repository.execute(request: .nowPlaying)
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
  
  func testExecuteMovieTopRate() {
    repository.execute(request: .topRated)
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
  
  func testExecuteMoviePopular() {
    repository.execute(request: .popular)
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
  
  func testExecuteMovieUpcoming() {
    repository.execute(request: .upcoming)
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
    ("testExecuteMovieNowPlaying", testExecuteMovieNowPlaying),
    ("testExecuteMovieTopRate", testExecuteMovieTopRate),
    ("testExecuteMoviePopular", testExecuteMoviePopular),
    ("testExecuteMovieUpcoming", testExecuteMovieUpcoming),
  ]
  
}
