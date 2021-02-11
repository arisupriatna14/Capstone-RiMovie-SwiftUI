//
//  ClassDicodingUIModel.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation

public struct ClassDicodingUIModel: Equatable, Identifiable {
  
  public let id = UUID()
  public let name: String
  public let url: String
  public let image: String
  
  public init(name: String, url: String, image: String) {
    self.name = name
    self.url = url
    self.image = image
  }
}

extension ClassDicodingUIModel {
  
  public static var stub: ClassDicodingUIModel {
    .init(name: "Menjadi iOS Developer Expert", url: "https://www.dicoding.com/academies/209", image: "class_1")
  }
  
  public static var stubs: [ClassDicodingUIModel] {
    return [
      .init(
        name: "Menjadi iOS Developer Expert",
        url: "https://www.dicoding.com/academies/209", image: "class_1"
      ),
      .init(
        name: "Belajar Fundamental Aplikasi iOS",
        url: "https://www.dicoding.com/academies/202", image: "class_2"
      ),
      .init(
        name: "Belajar Membuat Aplikasi iOS untuk Pemula",
        url: "https://www.dicoding.com/academies/171", image: "class_3"
      ),
      .init(
        name: "Memulai Pemrograman Dengan Swift",
        url: "https://www.dicoding.com/academies/145", image: "class_4"
      ),
      .init(
        name: "Belajar Prinsip Pemrograman SOLID",
        url: "https://www.dicoding.com/academies/169", image: "class_5"
      ),
      .init(
        name: "Memulai Pemrograman Dengan Kotlin",
        url: "https://www.dicoding.com/academies/80", image: "class_6"
      ),
      .init(
        name: "Belajar Membuat Aplikasi Android untuk Pemula",
        url: "https://www.dicoding.com/academies/51", image: "class_7"
      ),
      .init(
        name: "Belajar Dasar Pemrograman Web",
        url: "https://www.dicoding.com/academies/123", image: "class_8"
      )
    ]
  }
  
}
