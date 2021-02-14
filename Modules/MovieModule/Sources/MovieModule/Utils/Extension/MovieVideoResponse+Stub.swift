//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation

extension MovieVideosResponse {
  
  public static var stub: MovieVideosResponse {
    .init(results: [.stub, .stub])
  }
  
}

extension MovieVideoResponse {
  
  public static var stub: MovieVideoResponse {
    .init(id: "0", key: "TUyqi_vEcsE", name: "Teaser ✨ | Upside Down Magic | Disney Channel", site: "YouTube")
  }
  
}
