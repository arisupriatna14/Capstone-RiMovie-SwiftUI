//
//  SearchPresenter.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import SwiftUI
import Combine
import RiMovieCore

public class SearchPresenter<Request, Response, Interactor: UseCase>: ObservableObject
where Interactor.Request == Request, Interactor.Response == [Response] {
  
  private var cancellables: Set<AnyCancellable> = []
  private var subscriptionToken: AnyCancellable?
  private let _useCase: Interactor
  
  @Published public var query: String = ""
  @Published public var list: [Response]?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  
  public init(useCase: Interactor) {
    _useCase = useCase
  }
  
  public var isEmptyResult: Bool {
    return !self.query.isEmpty && self.list != nil && self.list!.isEmpty
  }
  
  deinit {
    self.subscriptionToken?.cancel()
    self.subscriptionToken = nil
  }
  
  public func startObserve() {
    self.subscriptionToken = self.$query.map {
      self.list = nil
      
      return $0 as? Request
    }
    .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
    .sink { self.search(request: $0) }
  }
  
  public func search(request: Request?) {
    
    guard !query.isEmpty else { return }
    
    isLoading = true
    
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { error in
        switch error {
        case .failure(let error):
          self.isError = true
          self.errorMessage = error.localizedDescription
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { result in
        self.list = result
      })
      .store(in: &cancellables)
    
  }
}
