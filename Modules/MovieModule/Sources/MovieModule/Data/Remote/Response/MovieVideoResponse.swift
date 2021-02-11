//
//  MovieVideoResponse.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MovieVideosResponse: Decodable {
  
  public let results: [MovieVideoResponse]
  
}

public struct MovieVideoResponse: Identifiable, Decodable {
  
  public let id: String
  public let key: String
  public let name: String
  public let site: String
  
}
