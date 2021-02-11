//
//  CertificateModel.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation

public struct CertificateModel: Equatable, Identifiable {

  public let id = UUID()
  public let image: String
  public let name: String
  public let url: String

  public init(image: String, name: String, url: String) {
    self.image = image
    self.name = name
    self.url = url
  }

}

extension CertificateModel {

  public static var stub: CertificateModel {
    .init(
      image: "certificate_1",
      name: "Belajar Fundamental Aplikasi iOS",
      url: "https://www.dicoding.com/certificates/D98XW77YJZM3"
    )
  }

  public static var stubs: [CertificateModel] {
    return [
      .init(
        image: "certificate_1",
        name: "Belajar Fundamental Aplikasi iOS",
        url: "https://www.dicoding.com/certificates/D98XW77YJZM3"
      ),
      .init(
        image: "certificate_2",
        name: "Belajar Membuat Aplikasi iOS untuk Pemula",
        url: "https://www.dicoding.com/certificates/KERZRJN3MPYV"
      ),
      .init(
        image: "certificate_3",
        name: "Belajar Prinsip Pemrograman SOLID",
        url: "https://www.dicoding.com/certificates/2L4PQKV77PO1"
      ),
      .init(
        image: "certificate_4",
        name: "Memulai Pemrograman Dengan Swift",
        url: "https://www.dicoding.com/certificates/3JMZVJ87JZN9"
      ),
      .init(
        image: "certificate_5",
        name: "Belajar Dasar Pemrograman Web",
        url: "https://www.dicoding.com/certificates/81P21V8VQZOY"
      ),
      .init(
        image: "certificate_6",
        name: "Menjadi Flutter Developer Expert (2019)",
        url: "https://www.dicoding.com/certificates/453XEG9GKPRN"
      ),
      .init(
        image: "certificate_7",
        name: "Memulai Pemrograman Dengan Kotlin",
        url: "https://www.dicoding.com/certificates/DMRZM31JLPYQ"
      ),
      .init(
        image: "certificate_8",
        name: "Belajar Membuat Aplikasi Android untuk Pemula",
        url: "https://www.dicoding.com/certificates/W07Z69YEJZQR"
      ),
      .init(
        image: "certificate_9",
        name: "Belajar Membangun LINE Chatbot",
        url: "https://www.dicoding.com/certificates/M2VX379ENZYQ"
      ),
      .init(
        image: "certificate_10",
        name: "Belajar Membangun Game HTML5",
        url: "https://www.dicoding.com/certificates/53XEEYJNVXRN"
      )
    ]
  }

}
