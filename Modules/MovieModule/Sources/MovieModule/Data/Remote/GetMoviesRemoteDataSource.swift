//
//  GetMoviesRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import Alamofire
import RiMovieCore

public struct GetMoviesRemoteDataSource: DataSource {
  
  public typealias Request = Endpoints.Gets
  public typealias Response = [MovieResponse]
  
  public init() { }
  
  public func execute(request: Endpoints.Gets?) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = request?.url ?? Endpoints.Gets.popular.url
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "page": "1"
      ])
      
      guard let url = urlComponents.url else { return }
      
      AF.request(url)
        .validate()
        .responseDecodable(of: MoviesResponse.self) { response in
          switch response.result {
          case .success(let movies):
            completion(.success(movies.results))
          case .failure:
            completion(.failure(MovieError.invalidResponse))
          }
        }
      
    }.eraseToAnyPublisher()
  }
  
}
