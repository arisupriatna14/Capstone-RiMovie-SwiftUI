//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore

public struct CertificateMapper: Mapper {
  
  public typealias Response = Any
  public typealias Domain = [CertificateModel]
  public typealias Entity = Any
  public typealias Presentation = [CertificateUIModel]
  
  public init() { }
  
  public func transformDomainToPresentation(domain: [CertificateModel]) -> [CertificateUIModel] {
    return domain.map {
      return CertificateUIModel(image: $0.image, name: $0.name, url: $0.url)
    }
  }
  
  public func transformEntityToDomain(entity: Any) -> [CertificateModel] {
    fatalError()
  }
  
  public func transformDomainToEntity(domain: [CertificateModel]) -> Any {
    fatalError()
  }
  
  public func transformResponseToDomain(response: Any) -> [CertificateModel] {
    fatalError()
  }
  
  public func transformPresentationToDomain(presentation: [CertificateUIModel]) -> [CertificateModel] {
    fatalError()
  }
}
