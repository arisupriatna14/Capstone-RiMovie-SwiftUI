//
//  MovieVideoUIModel.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public struct MovieVideoUIModel: Equatable, Identifiable {
  
  public let id: String
  public let key: String
  public let name: String
  public let site: String
  
  public var youtubeURL: URL? {
    guard site == "YouTube" else {
      return nil
    }
    
    return URL(string: "https://youtube.com/watch?v=\(key)")
  }
  
}
