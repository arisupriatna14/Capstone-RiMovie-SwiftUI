//
//  MoviesUpcomingView.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 11/02/21.
//

import SwiftUI
import MovieModule
import Resolver
import SDWebImageSwiftUI

struct MoviesUpcomingView: View {
  
  @ObservedObject var presenter: MoviesPresenter<MoviesInteractor>
  
  var body: some View {
    ZStack {
      if let movies = presenter.movieUpcoming {
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
    .navigationTitle(Text("Upcoming"))
    .onAppear {
      self.presenter.getMovies(request: .upcoming)
    }
  }
}

struct MoviesUpcomingView_Previews: PreviewProvider {
  static var previews: some View {
    MoviesUpcomingView(presenter: Resolver.resolve())
  }
}
