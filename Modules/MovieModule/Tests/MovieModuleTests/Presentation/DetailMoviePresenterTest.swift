//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import XCTest
import Resolver
@testable import MovieModule

final class DetailMoviePresenterTest: XCTestCase {
  
  private var presenter = DetailMoviePresenter<
    FakeMovieInteractor,
    FakeMovieSimilarInteractor,
    FakeAddMovieFavoriteInteractor,
    FakeMovieFavoriteInteractor,
    FakeUpdateMovieFavoriteInteractor
  >(
    movieUseCase: Resolver.resolve(),
    movieSimilarUseCase: Resolver.resolve(),
    addFavoriteUseCase: Resolver.resolve(),
    getFavoriteUseCase: Resolver.resolve(),
    updateFavoriteUseCase: Resolver.resolve()
  )
  
  func testPropertyPresenter() {
    XCTAssertFalse(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertNil(presenter.similarMovieList)
    XCTAssertNil(presenter.detailMovie)
    XCTAssertNil(presenter.movieFavorite)
    XCTAssertFalse(presenter.isAddedSuccessfully)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMovie() {
    presenter.getMovie(request: 0)
    
    XCTAssertTrue(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMovieSimilar() {
    presenter.getMovieSimilar(request: 0)
    
    XCTAssertTrue(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testUpdateMovie() {
    presenter.updateMovie(request: 0)
    
    XCTAssertTrue(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testAddMovieToFavorite() {
    presenter.addMovieToFavorite(request: .stub)
    
    XCTAssertFalse(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
  func testGetMovieFavorite() {
    presenter.getMovieFavorite(request: 0)
    
    XCTAssertFalse(presenter.isLoading)
    XCTAssertFalse(presenter.isError)
    XCTAssertEqual(presenter.errorMessage, "")
  }
  
}
