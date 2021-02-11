//
//  File.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation

public enum MovieError: Error {
  
  case apiError
  case invalidEndpoint
  case invalidResponse
  case noData
  case serializationError
  
  public var localizedDescription: String {
    switch self {
    case .apiError: return "Failed to fetch data"
    case .invalidEndpoint: return "Invalid endpoint"
    case .invalidResponse: return "Invalid response"
    case .noData: return "No data"
    case .serializationError: return "Failed to decode data"
    }
  }
  
}

public enum DatabaseError: LocalizedError {
  
  case invalidInstance
  case requestFailed
  
  public var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Database can't instance."
    case .requestFailed: return "Your request failed."
    }
  }
  
}
