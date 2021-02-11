//
//  MovieItemWatchView.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 12/02/21.
//

import SwiftUI
import MovieModule
import SDWebImageSwiftUI

struct MovieItemWatchView: View {
  
  var movie: MovieUIModel
  @State private var opacity: Double = 0.25
  
  var body: some View {
    VStack(alignment: .leading) {
      WebImage(url: movie.backdropPathURL)
        .resizable()
        .renderingMode(.original)
        .placeholder(content: {
          ShimmerView(opacity: $opacity)
            .frame(width: 125, height: 50)
        })
        .scaledToFit()
        .cornerRadius(8)
      
      Divider()
      
      Text(movie.title)
        .lineLimit(1)
        .font(.system(.footnote, design: .rounded))
    }
  }
}

struct MovieItemWatchView_Previews: PreviewProvider {
  static var previews: some View {
    MovieItemWatchView(movie: .stub)
  }
}
