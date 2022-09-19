//
//  SearchView.swift
//  RiMovie (iOS)
//
//  Created by Ari Supriatna on 22/12/20.
//

import SwiftUI
import MovieModule
import SearchModule

struct SearchView: View {
  
  @ObservedObject var presenter: SearchPresenter<String, MovieUIModel, SearchInteractor>
  
  var body: some View {
    ScrollView {
      Group {
        if presenter.isLoading {
          ProgressView()
        } else if presenter.isEmptyResult {
          VStack(alignment: .center) {
            Spacer()
            Text("Movie yang kamu cari tidak ditemukan 🥺")
          }
        } else if presenter.query.isEmpty {
          CustomEmptyView(
            image: "search_tab",
            title: "Search your favorite movies"
          )
          .offset(y: 50)
        }
      }
      
      if let movies = presenter.list {
        VStack {
          ForEach(movies) { item in
            linkBuilderMovieDetail(for: item) {
              MovieCardHorizontal(movie: item, isShowOverview: true)
                .padding(.bottom)
            }
          }
        }
        .padding(.all)
      }
    }
    .searchable(text: self.$presenter.query)
    .navigationTitle("Search Movies")
    .onAppear {
      self.presenter.startObserve()
    }
  }
}
