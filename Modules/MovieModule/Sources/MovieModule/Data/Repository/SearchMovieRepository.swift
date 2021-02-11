//
//  File.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import RiMovieCore

public struct SearchMovieRepository<
  SearchRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where SearchRemoteDataSource.Request == String,
      SearchRemoteDataSource.Response == [MovieResponse],
      Transformer.Response == [MovieResponse],
      Transformer.Domain == [MovieModel],
      Transformer.Presentation == [MovieUIModel],
      Transformer.Entity == [MovieEntity] {
  
  public typealias Request = String
  public typealias Response = [MovieUIModel]
  
  private let _remote: SearchRemoteDataSource
  private let _mapper: Transformer
  
  public init(remote: SearchRemoteDataSource, mapper: Transformer) {
    _remote = remote
    _mapper = mapper
  }
  
  public func execute(request: String?) -> AnyPublisher<[MovieUIModel], Error> {
    _remote.execute(request: request)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }

}
