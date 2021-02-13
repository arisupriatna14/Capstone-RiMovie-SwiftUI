//
//  ContentView.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 11/02/21.
//

import SwiftUI
import Resolver

struct ContentView: View {
  var body: some View {
    TabView {
      MoviesUpcomingView(presenter: Resolver.resolve())
      MoviesNowPlayingView(presenter: Resolver.resolve())
    }
    .tabViewStyle(PageTabViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
