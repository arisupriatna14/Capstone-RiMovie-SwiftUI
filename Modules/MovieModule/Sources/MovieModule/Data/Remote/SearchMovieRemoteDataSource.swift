//
//  SearchMovieRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import Alamofire
import RiMovieCore

public struct SearchMovieRemoteDataSource: DataSource {
  
  public typealias Request = String
  public typealias Response = [MovieResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: String?) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = _endpoint
      urlComponents.setQueryItems(with: [
        "api_key": API.apiKey,
        "language": "en-US",
        "query": request ?? "",
        "page": "1",
        "include_adult": "false"
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
