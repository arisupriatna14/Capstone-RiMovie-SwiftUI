//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Resolver
@testable import MovieModule

final class MoviesPresenterTest: XCTestCase {
  
  private var presenter = MoviesPresenter<FakeMoviesInteractor>(moviesUseCase: Resolver.resolve())
  
  func testPropertyPresenter() {
    XCTAssertFalse(presenter.isLoadingState)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
    XCTAssertNil(presenter.movieNowPlaying)
    XCTAssertNil(presenter.moviePopular)
    XCTAssertNil(presenter.movieUpcoming)
    XCTAssertNil(presenter.movieTopRated)
  }
  
  func testGetMoviesNowPlaying() {
    presenter.getMovies(request: .nowPlaying)
    
    XCTAssertTrue(presenter.isLoadingState)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMoviesUpcoming() {
    presenter.getMovies(request: .upcoming)
    
    XCTAssertTrue(presenter.isLoadingState)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMoviesTopRated() {
    presenter.getMovies(request: .topRated)
    
    XCTAssertTrue(presenter.isLoadingState)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMoviesPopular() {
    presenter.getMovies(request: .popular)
    
    XCTAssertTrue(presenter.isLoadingState)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  static var allTests = [
    ("testPropertyPresenter", testPropertyPresenter),
    ("testGetMoviesNowPlaying", testGetMoviesNowPlaying),
    ("testGetMoviesUpcoming", testGetMoviesUpcoming),
    ("testGetMoviesTopRated", testGetMoviesTopRated),
    ("testGetMoviesPopular", testGetMoviesPopular)
  ]
}
