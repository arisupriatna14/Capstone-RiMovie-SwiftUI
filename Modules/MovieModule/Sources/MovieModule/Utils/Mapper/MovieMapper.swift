//
//  MovieMapper.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RiMovieCore

public struct MovieMapper: Mapper {
  
  public typealias Response = [MovieResponse]
  public typealias Domain = [MovieModel]
  public typealias Entity = [MovieEntity]
  public typealias Presentation = [MovieUIModel]
  
  public init() { }
  
  public func transformResponseToDomain(response: [MovieResponse]) -> [MovieModel] {
    return response.map { result in
      var movieVideos: [MovieVideoModel]?
      var movieCast: [MovieCastModel]?
      var movieCrew: [MovieCrewModel]?
      
      if let results = result.videos?.results {
        movieVideos = MovieVideoMapper().transformResponseToDomain(response: results)
      }
      
      if let casts = result.credits?.cast {
        movieCast = MovieCastMapper().transformResponseToDomain(response: casts)
      }
      
      if let crews = result.credits?.crew {
        movieCrew = MovieCrewMapper().transformResponseToDomain(response: crews)
      }
      
      return MovieModel(
        id: result.id,
        backdropPath: result.backdropPath ?? "",
        originalTitle: result.originalTitle ?? "Unknown",
        overview: result.overview ?? "-",
        popularity: result.popularity ?? 0.0,
        posterPath: result.posterPath ?? "",
        title: result.title ?? "Unknown",
        voteAverage: result.voteAverage ?? 0.0,
        voteCount: result.voteCount ?? 0,
        videos: movieVideos ?? [.stub],
        cast: movieCast ?? [.stub],
        crew: movieCrew ?? [.stub]
      )
    }
  }
  
  public func transformEntityToDomain(entity: [MovieEntity]) -> [MovieModel] {
    return entity.map { movieEntity in
      
      let movieVideos = MovieVideoMapper().transformEntityToDomain(entity: Array(movieEntity.videos))
      let movieCast = MovieCastMapper().transformEntityToDomain(entity: Array(movieEntity.cast))
      let movieCrew = MovieCrewMapper().transformEntityToDomain(entity: Array(movieEntity.crew))
      
      return MovieModel(
        id: movieEntity.id,
        backdropPath: movieEntity.backdropPath,
        originalTitle: movieEntity.originalTitle,
        overview: movieEntity.overview,
        popularity: movieEntity.popularity,
        posterPath: movieEntity.posterPath,
        title: movieEntity.title,
        voteAverage: movieEntity.voteAverage,
        voteCount: movieEntity.voteCount,
        videos: movieVideos,
        cast: movieCast,
        crew: movieCrew,
        favorite: movieEntity.favorite
      )
    }
  }
  
  public func transformDomainToEntity(domain: [MovieModel]) -> [MovieEntity] {
    fatalError()
  }
  
  public func transformDomainToPresentation(domain: [MovieModel]) -> [MovieUIModel] {
    return domain.map {
      let movieVideos = MovieVideoMapper().transformDomainToPresentation(domain: $0.videos)
      let movieCast = MovieCastMapper().transformDomainToPresentation(domain: $0.cast)
      let movieCrew = MovieCrewMapper().transformDomainToPresentation(domain: $0.crew)
      
      return MovieUIModel(
        id: $0.id,
        backdropPath: $0.backdropPath,
        originalTitle: $0.originalTitle,
        overview: $0.overview,
        popularity: $0.popularity,
        posterPath: $0.posterPath,
        title: $0.title,
        voteAverage: $0.voteAverage,
        voteCount: $0.voteCount,
        videos: movieVideos,
        cast: movieCast,
        crew: movieCrew,
        favorite: $0.favorite
      )
    }
  }
  
  public func transformPresentationToDomain(presentation: [MovieUIModel]) -> [MovieModel] {
    fatalError()
  }
  
}
