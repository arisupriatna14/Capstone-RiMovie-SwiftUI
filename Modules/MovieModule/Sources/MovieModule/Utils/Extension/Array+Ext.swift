//
//  Array+Ext.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import RealmSwift

extension Array {
  public func toList<T>(ofType: T.Type) -> List<T> {
    let list = List<T>()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        list.append(result)
      }
    }
    
    return list
  }
}
