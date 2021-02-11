//
//  MovieDetailMapper.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RiMovieCore

public struct MovieDetailMapper: Mapper {
  
  public typealias Response = MovieResponse
  public typealias Domain = MovieModel
  public typealias Entity = MovieEntity
  public typealias Presentation = MovieUIModel
  
  public init() { }
  
  public func transformResponseToDomain(response: MovieResponse) -> MovieModel {
    var movieVideos: [MovieVideoModel]?
    var movieCast: [MovieCastModel]?
    var movieCrew: [MovieCrewModel]?
    
    if let results = response.videos?.results {
      movieVideos = MovieVideoMapper().transformResponseToDomain(response: results)
    }
    
    if let crews = response.credits?.crew {
      movieCrew = MovieCrewMapper().transformResponseToDomain(response: crews)
    }
    
    if let casts = response.credits?.cast {
      movieCast = MovieCastMapper().transformResponseToDomain(response: casts)
    }
    
    return MovieModel(
      id: response.id,
      backdropPath: response.backdropPath ?? "",
      originalTitle: response.originalTitle ?? "Unknown",
      overview: response.overview ?? "-",
      popularity: response.popularity ?? 0.0,
      posterPath: response.posterPath ?? "",
      title: response.title ?? "Unknown",
      voteAverage: response.voteAverage ?? 0.0,
      voteCount: response.voteCount ?? 0,
      videos: movieVideos ?? [.stub],
      cast: movieCast ?? [.stub],
      crew: movieCrew ?? [.stub]
    )
  }
  
  public func transformEntityToDomain(entity: MovieEntity) -> MovieModel {
    let movieVideos = MovieVideoMapper().transformEntityToDomain(entity: Array(entity.videos))
    let movieCast = MovieCastMapper().transformEntityToDomain(entity: Array(entity.cast))
    let movieCrew = MovieCrewMapper().transformEntityToDomain(entity: Array(entity.crew))
    
    return MovieModel(
      id: entity.id,
      backdropPath: entity.backdropPath,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      title: entity.title,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: entity.favorite
    )
  }
  
  public func transformDomainToEntity(domain: MovieModel) -> MovieEntity {
    let movieVideos = MovieVideoMapper().transformDomainToEntity(domain: domain.videos)
    let movieCrew = MovieCrewMapper().transformDomainToEntity(domain: domain.crew)
    let movieCast = MovieCastMapper().transformDomainToEntity(domain: domain.cast)
    
    let movieEntity = MovieEntity()
    movieEntity.id = domain.id
    movieEntity.backdropPath = domain.backdropPath
    movieEntity.originalTitle = domain.originalTitle
    movieEntity.overview = domain.overview
    movieEntity.popularity = domain.popularity
    movieEntity.posterPath = domain.posterPath
    movieEntity.title = domain.title
    movieEntity.voteAverage = domain.voteAverage
    movieEntity.voteCount = domain.voteCount
    movieEntity.videos = movieVideos.toList(ofType: MovieVideoEntity.self)
    movieEntity.cast = movieCast.toList(ofType: MovieCastEntity.self)
    movieEntity.crew = movieCrew.toList(ofType: MovieCrewEntity.self)
    movieEntity.favorite = domain.favorite
    
    return movieEntity
  }
  
  public func transformDomainToPresentation(domain: MovieModel) -> MovieUIModel {
    let movieVideos = MovieVideoMapper().transformDomainToPresentation(domain: domain.videos)
    let movieCast = MovieCastMapper().transformDomainToPresentation(domain: domain.cast)
    let movieCrew = MovieCrewMapper().transformDomainToPresentation(domain: domain.crew)
    
    return MovieUIModel(
      id: domain.id,
      backdropPath: domain.backdropPath,
      originalTitle: domain.originalTitle,
      overview: domain.overview,
      popularity: domain.popularity,
      posterPath: domain.posterPath,
      title: domain.title,
      voteAverage: domain.voteAverage,
      voteCount: domain.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: domain.favorite
    )
  }
  
  public func transformPresentationToDomain(presentation: MovieUIModel) -> MovieModel {
    let movieVideos = MovieVideoMapper().transformPresentationToDomain(presentation: presentation.videos)
    let movieCast = MovieCastMapper().transformPresentationToDomain(presentation: presentation.cast)
    let movieCrew = MovieCrewMapper().transformPresentationToDomain(presentation: presentation.crew)
    
    return MovieModel(
      id: presentation.id,
      backdropPath: presentation.backdropPath,
      originalTitle: presentation.originalTitle,
      overview: presentation.overview,
      popularity: presentation.popularity,
      posterPath: presentation.posterPath,
      title: presentation.title,
      voteAverage: presentation.voteAverage,
      voteCount: presentation.voteCount,
      videos: movieVideos,
      cast: movieCast,
      crew: movieCrew,
      favorite: presentation.favorite
    )
  }
}
