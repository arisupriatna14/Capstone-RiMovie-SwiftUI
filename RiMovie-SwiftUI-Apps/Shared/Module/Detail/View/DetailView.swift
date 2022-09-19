//
//  DetailView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 16/12/20.
//

import SwiftUI
import SDWebImageSwiftUI
import MovieModule
import Resolver

struct DetailView: View {
  
  @ObservedObject var presenter: DetailMoviePresenter<
    MovieInteractor,
    MovieSimilarInteractor,
    AddMovieFavoriteInteractor,
    MovieFavoriteInteractor,
    UpdateMovieFavoriteInteractor
  >
  @State private var opacity: Double = 0.25
  @State private var selectedVideo: MovieVideoUIModel?
  
  var movie: MovieUIModel
  
  var body: some View {
    ZStack {
      if let detailMovie = presenter.detailMovie,
         let similarMovie = presenter.similarMovieList {
        
        ScrollView(.vertical) {
          VStack(alignment: .leading) {
            WebImage(url: detailMovie.backdropPathURL)
              .resizable()
              .scaledToFit()
              .cornerRadius(10)
              .padding()
            
            Text("Overview")
              .font(.title2)
              .fontWeight(.bold)
              .padding(.horizontal)
            
            Text(detailMovie.overview)
              .padding()
            
            Group {
              if similarMovie.count > 0 {
                ListMovieSimilarView(similarMovie: similarMovie)
              }
              
              if detailMovie.cast.count > 0 {
                ListMovieCastView(movieCast: detailMovie.cast)
              }
              
              if detailMovie.crew.count > 0 {
                ListMovieCrewView(movieCrew: detailMovie.crew)
              }
              
              if detailMovie.videos.count > 0 {
                ListMovieTrailersView(videoTrailers: detailMovie.videos, selectedVideo: $selectedVideo)
              }
            }
            
          }
        }
      } else {
        ProgressView()
      }
    }
    .navigationTitle(movie.title)
    .sheet(item: self.$selectedVideo) { trailer in
      SafariView(url: trailer.youtubeURL!)
    }
    .toolbar {
      #if !APPCLIP
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: addToFavorite) {
          Image(systemName: presenter.movieFavorite?.favorite ?? false ? "star.fill" : "star")
        }
      }
      #endif
      
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          shareToInstagram()
        } label: {
          Image(systemName: "square.and.arrow.up")
        }
      }
    }
    .onAppear {
      if self.presenter.detailMovie == nil && self.presenter.similarMovieList == nil {
        self.presenter.getMovie(request: movie.id)
        self.presenter.getMovieSimilar(request: movie.id)
      }
      self.presenter.getMovieFavorite(request: movie.id)
    }
  }
}

extension DetailView {
  func addToFavorite() {
    if presenter.movieFavorite != nil {
      self.presenter.updateMovie(request: movie.id)
    } else {
      self.presenter.addMovieToFavorite(request: movie)
    }
  }
  
  @MainActor
  private func generateSnapshot(movie: MovieUIModel) -> UIImage {
    let renderer = ImageRenderer(content: ShareImageView(movie: movie))
    renderer.scale = 3.0
    
    return renderer.uiImage ?? UIImage()
  }
  
  @MainActor func shareToInstagram() {
    if let storiesUrl = URL(string: "instagram-stories://share") {
      if UIApplication.shared.canOpenURL(storiesUrl) {
        guard let imageData = generateSnapshot(movie: self.presenter.detailMovie ?? .stub).pngData() else { return }
        let pasteboardItems: [String: Any] = [
          "com.instagram.sharedSticker.stickerImage": imageData,
          "com.instagram.sharedSticker.backgroundTopColor": "#FFFFFF",
          "com.instagram.sharedSticker.backgroundBottomColor": "#FFFFFF"
        ]
        
        let pasteboardOptions = [
          UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
        ]
        
        UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
        UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
      } else {
        print("Instagram tidak ada")
      }
    }
  }
}
