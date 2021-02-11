//
//  MovieCreditUIModel.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MovieCrewUIModel: Equatable, Identifiable {
  
  public let id: Int
  public let job: String
  public let name: String
  public let profilePath: String
  
  public var profilePathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")!
  }
  
}

public struct MovieCastUIModel: Equatable, Identifiable {
  
  public let id: Int
  public let character: String
  public let name: String
  public let profilePath: String
  
  public var profilePathURL: URL {
    return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath)")!
  }
  
}
