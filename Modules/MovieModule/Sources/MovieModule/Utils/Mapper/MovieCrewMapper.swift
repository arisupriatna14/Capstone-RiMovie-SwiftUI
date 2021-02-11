//
//  MovieCrewMapper.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RiMovieCore

public struct MovieCrewMapper: Mapper {
  
  public typealias Response = [MovieCrewResponse]
  public typealias Domain = [MovieCrewModel]
  public typealias Entity = [MovieCrewEntity]
  public typealias Presentation = [MovieCrewUIModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [MovieCrewResponse]) -> [MovieCrewModel] {
    return response.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath ?? ""
      )
    }
  }
  
  public func transformEntityToDomain(entity: [MovieCrewEntity]) -> [MovieCrewModel] {
    return entity.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  public func transformDomainToEntity(domain: [MovieCrewModel]) -> [MovieCrewEntity] {
    return domain.map {
      let movieCrewEntity = MovieCrewEntity()
      movieCrewEntity.id = $0.id
      movieCrewEntity.job = $0.job
      movieCrewEntity.name = $0.name
      movieCrewEntity.profilePath = $0.profilePath
      
      return movieCrewEntity
    }
  }
  
  public func transformDomainToPresentation(domain: [MovieCrewModel]) -> [MovieCrewUIModel] {
    return domain.map {
      return MovieCrewUIModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  public func transformPresentationToDomain(presentation: [MovieCrewUIModel]) -> [MovieCrewModel] {
    return presentation.map {
      return MovieCrewModel(
        id: $0.id,
        job: $0.job,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
}
