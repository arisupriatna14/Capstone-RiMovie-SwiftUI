//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation

extension MovieResponse {
  
  public static var stub: MovieResponse {
    .init(
      id: 0,
      backdropPath: "/cjaOSjsjV6cl3uXdJqimktT880L.jpg",
      originalTitle: "The Croods: A New Age",
      overview: """
        After leaving their cave, the Croods encounter their biggest threat since leaving:\n
        another family called the Bettermans, who claim and show to be better and evolved.
        Grug grows suspicious of the Betterman parents, Phil and Hope, as they secretly plan to break
        up his daughter Eep with her loving boyfriend Guy to ensure that their daughter Dawn has a loving
        and smart partner to protect her.
      """,
      popularity: 1500,
      posterPath: "/4n8QNNdk4BOX9Dslfbz5Dy6j1HK.jpg",
      title: "The Croods: A New Age",
      voteAverage: 0.0,
      voteCount: 0,
      videos: .stub,
      credits: .stub
    )
  }
  
  public static var stubs: [MovieResponse] {
    return [.stub, .stub]
  }
  
}
