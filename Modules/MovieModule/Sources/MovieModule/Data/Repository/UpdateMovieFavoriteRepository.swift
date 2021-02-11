//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import RiMovieCore
import Combine

public struct UpdateMovieFavoriteRepository<
  UpdateMovieFavoriteLocaleDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository
where UpdateMovieFavoriteLocaleDataSource.Request == Int,
      UpdateMovieFavoriteLocaleDataSource.Response == MovieEntity,
      Transformer.Entity == MovieEntity,
      Transformer.Domain == MovieModel,
      Transformer.Response == MovieResponse,
      Transformer.Presentation == MovieUIModel {
  
  public typealias Request = Int
  public typealias Response = MovieUIModel
  
  private let _locale: UpdateMovieFavoriteLocaleDataSource
  private let _mapper: Transformer
  
  public init(locale: UpdateMovieFavoriteLocaleDataSource, mapper: Transformer) {
    _locale = locale
    _mapper = mapper
  }
  
  public func execute(request: Int?) -> AnyPublisher<MovieUIModel, Error> {
    _locale.update(id: request ?? 0)
      .map { _mapper.transformEntityToDomain(entity: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }
  
}
