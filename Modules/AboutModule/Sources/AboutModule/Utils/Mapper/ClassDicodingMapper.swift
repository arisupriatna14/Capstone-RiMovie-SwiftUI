//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore

public struct ClassDicodingMapper: Mapper {

  public typealias Response = Any
  public typealias Domain = [ClassDicodingModel]
  public typealias Entity = Any
  public typealias Presentation = [ClassDicodingUIModel]

  public init() { }

  public func transformDomainToPresentation(
    domain: [ClassDicodingModel]
  ) -> [ClassDicodingUIModel] {
    return domain.map {
      return ClassDicodingUIModel(name: $0.name, url: $0.url, image: $0.image)
    }
  }

  public func transformEntityToDomain(entity: Any) -> [ClassDicodingModel] {
    fatalError()
  }

  public func transformDomainToEntity(domain: [ClassDicodingModel]) -> Any {
    fatalError()
  }

  public func transformResponseToDomain(response: Any) -> [ClassDicodingModel] {
    fatalError()
  }

  public func transformPresentationToDomain(
    presentation: [ClassDicodingUIModel]
  ) -> [ClassDicodingModel] {
    fatalError()
  }

}
