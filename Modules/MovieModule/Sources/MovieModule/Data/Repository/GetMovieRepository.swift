//
//  GetMovieRepository.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import RiMovieCore

public struct GetMovieRepository<
  GetMovieRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetMovieRemoteDataSource.Request == Int,
      GetMovieRemoteDataSource.Response == MovieResponse,
      Transformer.Response == MovieResponse,
      Transformer.Domain == MovieModel,
      Transformer.Presentation == MovieUIModel,
      Transformer.Entity == MovieEntity {
  
  public typealias Request = Int
  public typealias Response = MovieUIModel
  
  private let _remote: GetMovieRemoteDataSource
  private let _mapper: Transformer
  
  public init(remote: GetMovieRemoteDataSource, mapper: Transformer) {
    _remote = remote
    _mapper = mapper
  }
  
  public func execute(request: Int?) -> AnyPublisher<MovieUIModel, Error> {
    _remote.execute(request: request)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }
  
}
