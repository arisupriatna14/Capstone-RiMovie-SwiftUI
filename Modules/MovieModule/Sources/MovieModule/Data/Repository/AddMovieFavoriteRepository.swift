//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore
import Combine

public struct AddMovieFavoriteRepository<
  AddMovieFavoriteLocaleDataSource: LocaleDataSource,
  Transformer: Mapper
>: Repository
where AddMovieFavoriteLocaleDataSource.Request == Int,
      AddMovieFavoriteLocaleDataSource.Response == MovieEntity,
      Transformer.Entity == MovieEntity,
      Transformer.Domain == MovieModel,
      Transformer.Response == MovieResponse,
      Transformer.Presentation == MovieUIModel {
  
  public typealias Request = MovieUIModel
  public typealias Response = Bool
  
  private let _locale: AddMovieFavoriteLocaleDataSource
  private let _mapper: Transformer
  
  public init(locale: AddMovieFavoriteLocaleDataSource, mapper: Transformer) {
    _locale = locale
    _mapper = mapper
  }
  
  public func execute(request: MovieUIModel?) -> AnyPublisher<Bool, Error> {
    let movie = _mapper.transformPresentationToDomain(presentation: request ?? .stub)
    return _locale.add(entities: _mapper.transformDomainToEntity(domain: movie))
  }
  
}
