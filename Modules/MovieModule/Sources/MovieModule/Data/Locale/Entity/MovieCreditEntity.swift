//
//  MovieCreditEntity.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import RealmSwift

public class MovieCrewEntity: Object {
  
  @objc dynamic var id = 0
  @objc dynamic var job = ""
  @objc dynamic var name = ""
  @objc dynamic var profilePath = ""
  
}

public class MovieCastEntity: Object {
  
  @objc dynamic var id = 0
  @objc dynamic var character = ""
  @objc dynamic var name = ""
  @objc dynamic var profilePath = ""
  
}
