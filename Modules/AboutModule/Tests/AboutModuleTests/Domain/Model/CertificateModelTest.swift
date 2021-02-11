//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import XCTest
@testable import AboutModule

final class CertificateModelTest: XCTestCase {
  
  func testModel() {
    let certificateModel: CertificateModel = .stub
    let image = "certificate_1"
    let name = "Belajar Fundamental Aplikasi iOS"
    let url = "https://www.dicoding.com/certificates/D98XW77YJZM3"
    
    XCTAssertEqual(certificateModel.name, name)
    XCTAssertEqual(certificateModel.image, image)
    XCTAssertEqual(certificateModel.url, url)
  }
  
  static var allTests = [
    ("testModel", testModel)
  ]
  
}
