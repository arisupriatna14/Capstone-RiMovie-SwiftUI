//
//  MovieCastMapper.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RiMovieCore

public struct MovieCastMapper: Mapper {
  
  public typealias Response = [MovieCastResponse]
  public typealias Domain = [MovieCastModel]
  public typealias Entity = [MovieCastEntity]
  public typealias Presentation = [MovieCastUIModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [MovieCastResponse]) -> [MovieCastModel] {
    return response.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath ?? ""
      )
    }
  }
  
  public func transformEntityToDomain(entity: [MovieCastEntity]) -> [MovieCastModel] {
    return entity.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  public func transformDomainToEntity(domain: [MovieCastModel]) -> [MovieCastEntity] {
    return domain.map {
      let movieCastEntity = MovieCastEntity()
      movieCastEntity.id = $0.id
      movieCastEntity.character = $0.character
      movieCastEntity.name = $0.name
      movieCastEntity.profilePath = $0.profilePath
      
      return movieCastEntity
    }
  }
  
  public func transformDomainToPresentation(domain: [MovieCastModel]) -> [MovieCastUIModel] {
    return domain.map {
      return MovieCastUIModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
  
  public func transformPresentationToDomain(presentation: [MovieCastUIModel]) -> [MovieCastModel] {
    return presentation.map {
      return MovieCastModel(
        id: $0.id,
        character: $0.character,
        name: $0.name,
        profilePath: $0.profilePath
      )
    }
  }
}
