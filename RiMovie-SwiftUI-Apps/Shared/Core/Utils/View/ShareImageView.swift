//
//  ShareImageView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 18/09/22.
//

import SwiftUI
import SDWebImageSwiftUI
import MovieModule

struct VisualEffect: UIViewRepresentable {
  @State var style : UIBlurEffect.Style // 1
  func makeUIView(context: Context) -> UIVisualEffectView {
    return UIVisualEffectView(effect: UIBlurEffect(style: style)) // 2
  }
  func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
  } // 3
}

struct ShareImageView: View {
  var movie: MovieUIModel
  var width: CGFloat = 200
  var padding: CGFloat = 8
  @State private var opacity: Double = 0.25
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      WebImage(url: movie.posterPathURL)
        .resizable()
        .renderingMode(.original)
        .placeholder(content: {
          ShimmerView(opacity: $opacity)
            .frame(width: 200, height: 250)
        })
        .scaledToFit()
        .frame(width: width)
        .cornerRadius(10)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(movie.title)
          .lineLimit(1)
          .font(.system(size: 14, weight: .semibold))
        
        Text(movie.overview)
          .lineLimit(2)
          .font(.caption2)
          .multilineTextAlignment(.leading)
      }
      .foregroundColor(.white)
      .padding(.all, padding)
    }
    .padding(.all, padding)
    .frame(width: width + 20)
    .background(Color.indigo)
    .cornerRadius(16)
  }
}

struct ShareImageView_Previews: PreviewProvider {
  static var previews: some View {
    ShareImageView(movie: .stub)
  }
}
