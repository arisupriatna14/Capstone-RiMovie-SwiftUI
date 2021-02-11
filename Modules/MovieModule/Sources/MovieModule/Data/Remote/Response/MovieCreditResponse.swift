//
//  MovieCreditResponse.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MovieCreditResponse: Decodable {
  
  public let cast: [MovieCastResponse]
  public let crew: [MovieCrewResponse]
  
}

public struct MovieCrewResponse: Decodable, Identifiable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case job = "job"
    case name = "name"
    case profilePath = "profile_path"
  }
  
  public let id: Int
  public let job: String
  public let name: String
  public let profilePath: String?
  
}

public struct MovieCastResponse: Decodable, Identifiable {
  
  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case character = "character"
    case name = "name"
    case profilePath = "profile_path"
  }
  
  public let id: Int
  public let character: String
  public let name: String
  public let profilePath: String?
  
}
