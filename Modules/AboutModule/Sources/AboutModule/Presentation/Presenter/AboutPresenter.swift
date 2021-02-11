//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import SwiftUI
import Combine

public class AboutPresenter: ObservableObject {
  
  private let _useCase: AboutUseCase
  
  @Published public var certificates: [CertificateUIModel]?
  @Published public var classes: [ClassDicodingUIModel]?
  
  public init(useCase: AboutUseCase) {
    _useCase = useCase
  }
  
  public func getCertificates() {
    certificates = _useCase.getCertificates()
  }
  
  public func getClasses() {
    classes = _useCase.getClasses()
  }
  
}
