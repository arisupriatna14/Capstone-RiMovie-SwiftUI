//
//  File.swift
//  
//
//  Created by Ari Supriatna on 12/02/21.
//

import Foundation
import MovieModule
import RiMovieCore
import Combine

struct FakeGetMoviesRemoteDataSource: DataSource {
  
  public typealias Request = Endpoints.Gets
  public typealias Response = [MovieResponse]
  
  func execute(request: Endpoints.Gets?) -> AnyPublisher<[MovieResponse], Error> {
    
    if request != nil {
      return Future<[MovieResponse], Error> { completion in
        completion(.success(MovieResponse.stubs))
      }
      .eraseToAnyPublisher()
    } else {
      return Future<[MovieResponse], Error> { completion in
        completion(.success(MovieResponse.stubs))
      }
      .eraseToAnyPublisher()
    }
    
  }
  
}
