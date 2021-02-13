//
//  MoviesNowPlayingRouter.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 12/02/21.
//

import RiMovieCore
import MovieModule
import Resolver
import SwiftUI

class MoviesNowPlayingRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    return DetailWatchView(presenter: Resolver.resolve(), movie: movie)
  }
  
}

extension MoviesNowPlayingView {
  
  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: MoviesNowPlayingRouter().makeMovieDetailView(for: movie)) {
      content()
    }
  }
  
}
