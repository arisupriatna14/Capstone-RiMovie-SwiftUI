//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import XCTest
import Resolver
@testable import AboutModule

final class AboutPresenterTests: XCTestCase {
  
  private var presenter = AboutPresenter(useCase: Resolver.resolve())
  
  override func setUp() {
    Resolver.registerAllServices()
  }
  
  func testGetClassDicoding() {
    presenter.getClasses()
    
    XCTAssertEqual(presenter.classes?.isEmpty, false)
    XCTAssertEqual(presenter.classes?.count, 8)
    XCTAssertEqual(presenter.classes?[0].image, "class_1")
    XCTAssertEqual(presenter.classes?[0].name, "Menjadi iOS Developer Expert")
    XCTAssertEqual(presenter.classes?[0].url, "https://www.dicoding.com/academies/209")
  }
  
  func testGetCertificate() {
    presenter.getCertificates()
    
    XCTAssertEqual(presenter.certificates?.isEmpty, false)
    XCTAssertEqual(presenter.certificates?.count, 10)
    XCTAssertEqual(presenter.certificates?[0].image, "certificate_1")
    XCTAssertEqual(presenter.certificates?[0].name, "Belajar Fundamental Aplikasi iOS")
    XCTAssertEqual(presenter.certificates?[0].url, "https://www.dicoding.com/certificates/D98XW77YJZM3")
  }
  
  static var allTests = [
    ("testGetClassDicoding", testGetClassDicoding),
    ("testGetCertificate", testGetCertificate)
  ]
  
}

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register {
      AboutRepository() as AboutRepositoryProtocol
    }
    
    register {
      AboutInteractor(repository: resolve()) as AboutUseCase
    }
  }
}
