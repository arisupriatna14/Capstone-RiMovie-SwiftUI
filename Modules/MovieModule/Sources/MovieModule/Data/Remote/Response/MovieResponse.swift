//
//  MovieResponse.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MoviesResponse: Decodable {
  
  public let results: [MovieResponse]
  
}

public struct MovieResponse: Decodable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case backdropPath = "backdrop_path"
    case originalTitle = "original_title"
    case overview = "overview"
    case popularity = "popularity"
    case posterPath = "poster_path"
    case title = "title"
    case voteAverage = "vote_average"
    case voteCount = "vote_count"
    case videos = "videos"
    case credits = "credits"
  }
  
  public let id: Int
  public let backdropPath: String?
  public let originalTitle: String?
  public let overview: String?
  public let popularity: Double?
  public let posterPath: String?
  public let title: String?
  public let voteAverage: Double?
  public let voteCount: Int?
  public let videos: MovieVideosResponse?
  public let credits: MovieCreditResponse?
  
}
