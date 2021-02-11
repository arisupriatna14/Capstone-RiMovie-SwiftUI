//
//  MovieVideoMapper.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RiMovieCore

public struct MovieVideoMapper: Mapper {
  
  public typealias Response = [MovieVideoResponse]
  public typealias Domain = [MovieVideoModel]
  public typealias Entity = [MovieVideoEntity]
  public typealias Presentation = [MovieVideoUIModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [MovieVideoResponse]) -> [MovieVideoModel] {
    return response.map { result in
      return MovieVideoModel(
        id: result.id,
        key: result.key,
        name: result.name,
        site: result.site
      )
    }
  }
  
  public func transformEntityToDomain(entity: [MovieVideoEntity]) -> [MovieVideoModel] {
    return entity.map { result in
      return MovieVideoModel(
        id: result.id,
        key: result.key,
        name: result.name,
        site: result.site
      )
    }
  }
  
  public func transformDomainToEntity(domain: [MovieVideoModel]) -> [MovieVideoEntity] {
    return domain.map {
      let movieVideoEntity = MovieVideoEntity()
      movieVideoEntity.id = $0.id
      movieVideoEntity.key = $0.key
      movieVideoEntity.name = $0.name
      movieVideoEntity.site = $0.site
      
      return movieVideoEntity
    }
  }
  
  public func transformDomainToPresentation(domain: [MovieVideoModel]) -> [MovieVideoUIModel] {
    return domain.map { result in
      return MovieVideoUIModel(
        id: result.id,
        key: result.key,
        name: result.name,
        site: result.site
      )
    }
  }
  
  public func transformPresentationToDomain(presentation: [MovieVideoUIModel]) -> [MovieVideoModel] {
    return presentation.map {
      return MovieVideoModel(
        id: $0.id,
        key: $0.key,
        name: $0.name,
        site: $0.site
      )
    }
  }
  
}
