//
//  MoviesNowPlayingView.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 12/02/21.
//

import SwiftUI
import Resolver
import MovieModule

struct MoviesNowPlayingView: View {
  
  @ObservedObject var presenter: MoviesPresenter<MoviesInteractor>
  
  var body: some View {
    ZStack {
      if let movies = presenter.movieNowPlaying {
        List {
          ForEach(movies) { item in
            linkBuilderMovieDetail(for: item) {
              MovieItemWatchView(movie: item)
                .padding(.vertical, 8)
            }
          }
        }
        .listStyle(PlainListStyle())
      } else {
        ProgressView()
      }
    }
    .navigationTitle(Text("Now Playing"))
    .onAppear {
      self.presenter.getMovies(request: .nowPlaying)
    }
  }
}

struct MoviesNowPlayingView_Previews: PreviewProvider {
  static var previews: some View {
    MoviesNowPlayingView(presenter: Resolver.resolve())
  }
}
