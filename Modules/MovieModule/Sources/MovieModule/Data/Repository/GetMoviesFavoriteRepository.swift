//
//  GetMoviesFavoriteRepository.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import Combine
import RiMovieCore

public struct GetMoviesFavoriteRepository<
  GetMoviesFavoriteLocaleDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository
where GetMoviesFavoriteLocaleDataSource.Request == Int,
      GetMoviesFavoriteLocaleDataSource.Response == MovieEntity,
      Transformer.Entity == [MovieEntity],
      Transformer.Domain == [MovieModel],
      Transformer.Response == [MovieResponse],
      Transformer.Presentation == [MovieUIModel] {
  
  public typealias Request = Any
  public typealias Response = [MovieUIModel]
  
  private let _locale: GetMoviesFavoriteLocaleDataSource
  private let _mapper: Transformer
  
  public init(locale: GetMoviesFavoriteLocaleDataSource, mapper: Transformer) {
    _locale = locale
    _mapper = mapper
  }
  
  public func execute(request: Any?) -> AnyPublisher<[MovieUIModel], Error> {
    _locale.list(request: nil)
      .map { _mapper.transformEntityToDomain(entity: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }
  
}
