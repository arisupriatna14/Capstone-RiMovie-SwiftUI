//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation

public protocol AboutUseCase {

  func getCertificates() -> [CertificateUIModel]
  func getClasses() -> [ClassDicodingUIModel]

}

public class AboutInteractor: AboutUseCase {

  private let repository: AboutRepositoryProtocol

  public required init(repository: AboutRepositoryProtocol) {
    self.repository = repository
  }

  public func getCertificates() -> [CertificateUIModel] {
    return CertificateMapper().transformDomainToPresentation(domain: repository.getCertificates())
  }

  public func getClasses() -> [ClassDicodingUIModel] {
    return ClassDicodingMapper().transformDomainToPresentation(domain: repository.getMyClass())
  }

}
