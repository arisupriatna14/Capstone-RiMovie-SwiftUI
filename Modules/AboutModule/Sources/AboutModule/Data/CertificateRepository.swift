//
//  AboutRepository.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore
import Combine

public protocol AboutRepositoryProtocol {
  
  func getCertificates() -> [CertificateModel]
  func getMyClass() -> [ClassDicodingModel]
  
}

public class AboutRepository: AboutRepositoryProtocol {
  
  public init() { }
  
  public func getCertificates() -> [CertificateModel] {
    return CertificateModel.stubs
  }
  
  public func getMyClass() -> [ClassDicodingModel] {
    return ClassDicodingModel.stubs
  }
  
}
