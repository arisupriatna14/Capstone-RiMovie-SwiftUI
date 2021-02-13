//
//  DetailWatchView.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 12/02/21.
//

import SwiftUI
import RiMovieCore
import MovieModule
import SDWebImageSwiftUI
import Resolver

struct DetailWatchView: View {
  
  @ObservedObject var presenter: GetItemPresenter<Int, MovieUIModel, MovieInteractor>
  @State private var opacity: Double = 0.25
  
  var movie: MovieUIModel
  
  var body: some View {
    List {
      WebImage(url: movie.backdropPathURL)
        .resizable()
        .renderingMode(.original)
        .placeholder(content: {
          ShimmerView(opacity: $opacity)
            .frame(width: 125, height: 50)
        })
        .scaledToFill()
        .cornerRadius(8)
        .padding(.vertical, 8)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(movie.title)
          .font(.system(size: 15, weight: .medium, design: .rounded))

        Text(movie.overview)
          .font(.system(size: 12, weight: .regular, design: .rounded))
      }
      .padding(.vertical, 8)
    }
    .navigationTitle(Text("Detail"))
  }
}

struct DetailWatchView_Previews: PreviewProvider {
  static var previews: some View {
    DetailWatchView(presenter: Resolver.resolve(), movie: .stub)
  }
}
