//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation
import RiMovieCore
import MovieModule
import Combine
import RealmSwift

struct FakeFavoriteMovieLocaleDataSource: LocaleDataSource {
  
  public typealias Request = Int
  public typealias Response = MovieEntity
  
  func add(entities: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      completion(.success(true))
    }.eraseToAnyPublisher()
  }
  
  func update(id: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      let movieEntity = MovieDetailMapper().transformDomainToEntity(domain: MovieModel.stub)
      completion(.success(movieEntity))
    }.eraseToAnyPublisher()
  }
  
  func get(id: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      let movieEntity = MovieDetailMapper().transformDomainToEntity(domain: MovieModel.stub)
      completion(.success(movieEntity))
    }.eraseToAnyPublisher()
  }
  
  func list(request: Int?) -> AnyPublisher<[MovieEntity], Error> {
    return Future<[MovieEntity], Error> { completion in
      let moviesEntity = MovieMapper().transformDomainToEntity(domain: MovieModel.stubs)
      completion(.success(moviesEntity))
    }.eraseToAnyPublisher()
  }
  
}
