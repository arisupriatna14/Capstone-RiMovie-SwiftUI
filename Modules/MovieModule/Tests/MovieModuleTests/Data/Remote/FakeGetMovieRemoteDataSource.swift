//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation
import Combine
import RiMovieCore
import MovieModule

struct FakeGetMovieRemoteDataSource: DataSource {
  
  public typealias Request = Int
  public typealias Response = MovieResponse
  
  func execute(request: Int?) -> AnyPublisher<MovieResponse, Error> {
    
    if request != nil {
      return Future<MovieResponse, Error> { completion in
        completion(.success(MovieResponse.stub))
      }
      .eraseToAnyPublisher()
    } else {
      return Future<MovieResponse, Error> { completion in
        completion(.success(MovieResponse.stub))
      }
      .eraseToAnyPublisher()
    }
    
  }
  
}
