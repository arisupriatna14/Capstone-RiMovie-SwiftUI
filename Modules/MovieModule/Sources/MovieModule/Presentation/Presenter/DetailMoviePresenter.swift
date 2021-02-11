//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import SwiftUI
import Combine
import RiMovieCore

public class DetailMoviePresenter<
  MovieUseCase: UseCase,
  MovieSimilarUseCase: UseCase,
  AddFavoriteUseCase: UseCase,
  GetFavoriteUseCase: UseCase,
  UpdateFavoriteUseCase: UseCase
>: ObservableObject
where MovieUseCase.Request == Int,
      MovieUseCase.Response == MovieUIModel,
      MovieSimilarUseCase.Request == Int,
      MovieSimilarUseCase.Response == [MovieUIModel],
      AddFavoriteUseCase.Request == MovieUIModel,
      AddFavoriteUseCase.Response == Bool,
      GetFavoriteUseCase.Request == Int,
      GetFavoriteUseCase.Response == MovieUIModel,
      UpdateFavoriteUseCase.Request == Int,
      UpdateFavoriteUseCase.Response == MovieUIModel {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let _movieUseCase: MovieUseCase
  private let _movieSimilarUseCase: MovieSimilarUseCase
  private let _addFavoriteUseCase: AddFavoriteUseCase
  private let _getFavoriteUseCase: GetFavoriteUseCase
  private let _updateFavoriteUseCase: UpdateFavoriteUseCase
  
  @Published public var similarMovieList: [MovieUIModel]?
  @Published public var detailMovie: MovieUIModel?
  @Published public var movieFavorite: MovieUIModel?
  @Published public var isAddedSuccessfully: Bool = false
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(
    movieUseCase: MovieUseCase,
    movieSimilarUseCase: MovieSimilarUseCase,
    addFavoriteUseCase: AddFavoriteUseCase,
    getFavoriteUseCase: GetFavoriteUseCase,
    updateFavoriteUseCase: UpdateFavoriteUseCase
  ) {
    _movieUseCase = movieUseCase
    _movieSimilarUseCase = movieSimilarUseCase
    _addFavoriteUseCase = addFavoriteUseCase
    _getFavoriteUseCase = getFavoriteUseCase
    _updateFavoriteUseCase = updateFavoriteUseCase
  }
  
  public func getMovie(request: MovieUseCase.Request) {
    isLoading = true
    
    _movieUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (movie) in
        self.detailMovie = movie
      }
      .store(in: &cancellables)
  }
  
  public func getMovieSimilar(request: MovieSimilarUseCase.Request) {
    isLoading = true
    
    _movieSimilarUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (moviesSimilar) in
        self.similarMovieList = moviesSimilar
      }
      .store(in: &cancellables)

  }
  
  public func updateMovie(request: UpdateFavoriteUseCase.Request) {
    isLoading = true
    
    _updateFavoriteUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (movie) in
        self.movieFavorite = movie
      }
      .store(in: &cancellables)
  }
  
  public func addMovieToFavorite(request: AddFavoriteUseCase.Request) {
    _addFavoriteUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (isSuccesAdded) in
        self.isAddedSuccessfully = isSuccesAdded
        if isSuccesAdded {
          self.updateMovie(request: request.id)
        }
      }
      .store(in: &cancellables)
  }
  
  public func getMovieFavorite(request: GetFavoriteUseCase.Request) {
    _getFavoriteUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink { (completion) in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      } receiveValue: { (movie) in
        self.movieFavorite = movie
      }
      .store(in: &cancellables)
  }
}
