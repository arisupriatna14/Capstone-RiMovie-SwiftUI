//
//  MoviesPresenter.swift
//  
//
//  Created by Ari Supriatna on 09/02/21.
//

import SwiftUI
import Combine
import RiMovieCore

public class MoviesPresenter<MoviesUseCase: UseCase>: ObservableObject
where MoviesUseCase.Request == Endpoints.Gets,
      MoviesUseCase.Response == [MovieUIModel] {
  
  private var cancellables: Set<AnyCancellable> = []
  
  private let _moviesUseCase: MoviesUseCase
  
  public init(moviesUseCase: MoviesUseCase) {
    _moviesUseCase = moviesUseCase
  }
  
  @Published public var isLoadingState: Bool = false
  @Published public var isError: Bool = false
  @Published public var movieUpcoming: [MovieUIModel]?
  @Published public var moviePopular: [MovieUIModel]?
  @Published public var movieTopRated: [MovieUIModel]?
  @Published public var movieNowPlaying: [MovieUIModel]?
  @Published public var errorMessage: String = ""
  
  public func getMovies(request: MoviesUseCase.Request) {
    isLoadingState = true
    
    _moviesUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.isLoadingState = false
          self.isError = true
          self.errorMessage = error.localizedDescription
        case .finished:
          self.isLoadingState = false
        }
      }, receiveValue: { result in
        switch request {
        case .nowPlaying:
          self.movieNowPlaying = result
        case .popular:
          self.moviePopular = result
        case .topRated:
          self.movieTopRated = result
        case .upcoming:
          self.movieUpcoming = result
        default:
          debugPrint("Wrong endpoint")
        }
      })
      .store(in: &cancellables)
  }
}
