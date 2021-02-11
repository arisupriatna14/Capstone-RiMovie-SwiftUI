//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import XCTest
@testable import AboutModule

final class ClassDicodingModelTest: XCTestCase {
  
  func testModel() {
    let classDicodingModel: ClassDicodingModel = .stub
    let image = "class_1"
    let name = "Menjadi iOS Developer Expert"
    let url = "https://www.dicoding.com/academies/209"
    
    XCTAssertEqual(classDicodingModel.name, name)
    XCTAssertEqual(classDicodingModel.url, url)
    XCTAssertEqual(classDicodingModel.image, image)
  }
  
  static var allTests = [
    ("testModel", testModel)
  ]
}
