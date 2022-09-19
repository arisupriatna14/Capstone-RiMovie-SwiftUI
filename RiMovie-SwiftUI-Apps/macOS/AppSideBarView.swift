//
//  AppSideBarView.swift
//  RiMovie
//
//  Created by Ari Supriatna on 19/09/22.
//

import SwiftUI

struct AppSideBarView: View {
  @State private var selectionSidebarMenu: SidebarMenu? = .watchNow
  
  var body: some View {
    sidebarView
  }
  
  enum SidebarMenu: String, Codable {
    case watchNow
    case favorite
    case search
    case account
    
    var title: String {
      switch self {
      case .watchNow: return "Watch Now"
      case .favorite: return "Favorite"
      case .search: return "Search"
      case .account: return "Account"
      }
    }
    
    var iconName: String {
      switch self {
      case .watchNow: return "play.circle.fill"
      case .favorite: return "heart.circle.fill"
      case .search: return "magnifyingglass.circle.fill"
      case .account: return "person.crop.circle.fill"
      }
    }
  }
  
  var sidebarContent: some View {
    List(selection: $selectionSidebarMenu) {
      link(to: .watchNow)
      link(to: .favorite)
      link(to: .search)
      link(to: .account)
    }
    .navigationTitle(Text("RiMovie+"))
  }
  
  func link(to page: SidebarMenu) -> some View {
    NavigationLink(value: page) {
      Label {
        Text(page.title)
      } icon: {
        Image(systemName: page.iconName)
      }
    }
  }
  
  var sidebarView: some View {
    NavigationSplitView {
      sidebarContent
    } detail: {
      NavigationStack {
        if let selectionSidebarMenu {
          switch selectionSidebarMenu {
          case .watchNow:
            Text("Home Page")
          case .favorite:
            Text("Favorite Page")
          case .search:
            Text("Search Page")
          case .account:
            Text("Account Page")
          }
        }
      }
    }
  }
}

struct AppSideBarView_Previews: PreviewProvider {
  static var previews: some View {
    AppSideBarView()
  }
}
