//
//  File.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

extension URLComponents {
  
  mutating func setQueryItems(with parameters: [String: String]) {
    self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
  }
  
}
