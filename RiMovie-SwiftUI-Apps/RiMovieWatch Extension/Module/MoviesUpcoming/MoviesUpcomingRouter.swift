//
//  MoviesUpcomingRouter.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 12/02/21.
//

import SwiftUI
import RiMovieCore
import MovieModule
import Resolver

class MoviesUpcomingRouter {
  
  func makeMovieDetailView(for movie: MovieUIModel) -> some View {
    return DetailWatchView(presenter: Resolver.resolve(), movie: movie)
  }
  
}

extension MoviesUpcomingView {
  
  func linkBuilderMovieDetail<Content: View>(
    for movie: MovieUIModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: MoviesUpcomingRouter().makeMovieDetailView(for: movie)) {
      content()
    }
  }
  
}
