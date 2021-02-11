//
//  MovieUIModel.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MovieUIModel: Equatable, Identifiable {
  
  public let id: Int
  public let backdropPath: String
  public let originalTitle: String
  public let overview: String
  public let popularity: Double
  public let posterPath: String
  public let title: String
  public let voteAverage: Double
  public let voteCount: Int
  public let videos: [MovieVideoUIModel]
  public let cast: [MovieCastUIModel]
  public let crew: [MovieCrewUIModel]
  public var favorite: Bool = false
  
  public var backdropPathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath)")!
  }
  
  public var posterPathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
  }
  
  public var youtubeTrailers: [MovieVideoUIModel]? {
    videos.filter { $0.youtubeURL != nil }
  }
  
}
