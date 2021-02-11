//
//  MovieEntity.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RealmSwift

public class MovieEntity: Object {
  @objc dynamic var id = 0
  @objc dynamic var backdropPath = ""
  @objc dynamic var originalTitle = ""
  @objc dynamic var overview = ""
  @objc dynamic var popularity = 0.0
  @objc dynamic var posterPath = ""
  @objc dynamic var title = ""
  @objc dynamic var voteAverage = 0.0
  @objc dynamic var voteCount = 0
  @objc dynamic var favorite = false
  
  public var videos = List<MovieVideoEntity>()
  public var cast = List<MovieCastEntity>()
  public var crew = List<MovieCrewEntity>()
  
  public override static func primaryKey() -> String? {
    return "id"
  }
}
