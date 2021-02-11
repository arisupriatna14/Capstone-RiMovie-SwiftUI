//
//  GetMovieSimilarRemoteDataSource.swift
//  
//
//  Created by Ari Supriatna on 08/02/21.
//

import Foundation
import Combine
import Alamofire
import RiMovieCore

public struct GetMovieSimilarRemoteDataSource: DataSource {
  
  public typealias Request = Int
  public typealias Response = [MovieResponse]
  
  private let _endpoint: String
  
  public init(endpoint: String) {
    _endpoint = endpoint
  }
  
  public func execute(request: Int?) -> AnyPublisher<[MovieResponse], Error> {
    return Future<[MovieResponse], Error> { completion in
      
      var urlComponents = API.baseUrlComponents
      urlComponents.path = "\(_endpoint)/\(request ?? 0)/similar"
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
