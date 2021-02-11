//
//  GetMoviesRepository.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import RiMovieCore

public struct GetMoviesRepository<
  GetMoviesRemoteDataSource: DataSource,
  Transformer: Mapper
>: Repository
where GetMoviesRemoteDataSource.Request == Endpoints.Gets,
      GetMoviesRemoteDataSource.Response == [MovieResponse],
      Transformer.Response == [MovieResponse],
      Transformer.Domain == [MovieModel],
      Transformer.Presentation == [MovieUIModel],
      Transformer.Entity == [MovieEntity] {
  
  public typealias Request = Endpoints.Gets
  public typealias Response = [MovieUIModel]
  
  private let _remote: GetMoviesRemoteDataSource
  private let _mapper: Transformer
  
  public init(remote: GetMoviesRemoteDataSource, mapper: Transformer) {
    _remote = remote
    _mapper = mapper
  }
  
  public func execute(request: Endpoints.Gets?) -> AnyPublisher<[MovieUIModel], Error> {
    _remote.execute(request: request)
      .map { _mapper.transformResponseToDomain(response: $0) }
      .map { _mapper.transformDomainToPresentation(domain: $0) }
      .eraseToAnyPublisher()
  }
  
}
