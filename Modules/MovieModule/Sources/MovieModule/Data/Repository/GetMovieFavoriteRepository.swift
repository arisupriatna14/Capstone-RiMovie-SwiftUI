//
//  GetMoviesFavoriteRepository.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore
import Combine

public struct GetMovieFavoriteRepository<
  GetMovieFavoriteLocaleDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository
where GetMovieFavoriteLocaleDataSource.Request == Int,
      GetMovieFavoriteLocaleDataSource.Response == MovieEntity,
      Transformer.Entity == MovieEntity,
      Transformer.Domain == MovieModel,
      Transformer.Response == MovieResponse,
      Transformer.Presentation == MovieUIModel {
  
  public typealias Request = Int
  public typealias Response = MovieUIModel
  
  private let _locale: GetMovieFavoriteLocaleDataSource
  private let _mapper: Transformer
  
  public init(locale: GetMovieFavoriteLocaleDataSource, mapper: Transformer) {
    _locale = locale
    _mapper = mapper
  }
  
  public func execute(request: Int?) -> AnyPublisher<MovieUIModel, Error> {
    _locale.get(id: request ?? 0)
      .map { _mapper.transformEntityToDomain(entity: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }
  
}
