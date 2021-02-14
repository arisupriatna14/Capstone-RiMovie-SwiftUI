//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation

extension MovieCreditResponse {
  
  public static var stub: MovieCreditResponse {
    .init(cast: [.stub, .stub], crew: [.stub, .stub])
  }
  
}

extension MovieCrewResponse {
  
  public static var stub: MovieCrewResponse {
    .init(id: 0, job: "Director", name: "Joe Nussbaum", profilePath: "/24TedWAIXRxhjVh9SNwlWGUeuMp.jpg")
  }
  
}

extension MovieCastResponse {
  
  public static var stub: MovieCastResponse {
    .init(
      id: 2560614,
      character: "Nory Boxwood Horace",
      name: "Izabela Rose",
      profilePath: "/p6TY55Yzq0cGyeSzzB2zFTzhvCf.jpg"
    )
  }
  
}
