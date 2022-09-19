//
//  ContentView.swift
//  Shared
//
//  Created by Ari Supriatna on 15/12/20.
//

import SwiftUI
#if os(iOS)
import Resolver
#endif

struct ContentView: View {
  @State private var selection: String = "home"
  @State private var selectionSidebarMenu: SidebarMenu? = .watchNow
  
  #if os(iOS)
  @Environment(\.horizontalSizeClass) private var sizeClass
  #endif
  
  @ViewBuilder
  var body: some View {
    #if os(iOS)
    if sizeClass == .compact {
      tabBarView
    } else {
      sidebarView
    }
    #else
    AppSideBarView()
      .frame(minWidth: 1016, maxWidth: .infinity, minHeight: 556, maxHeight: .infinity)
    #endif
  }
  
  #if os(iOS)
  var tabBarView: some View {
    TabView(selection: $selection) {
      NavigationView {
        HomeView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "play.circle.fill")
        Text("Watch Now")
      }
      .tag("home")
      
      NavigationView {
        FavoriteView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "heart.circle.fill")
        Text("Favorite")
      }
      .tag("favorite")
      
      NavigationView {
        SearchView(presenter: Resolver.resolve())
      }
      .tabItem {
        Image(systemName: "magnifyingglass.circle.fill")
        Text("Search")
      }
      .tag("search")
      
      NavigationView {
        AboutView(presenter: Resolver.resolve())
      }
      .navigationViewStyle(StackNavigationViewStyle())
      .tabItem {
        Image(systemName: "person.crop.circle.fill")
        Text("About")
      }
      .tag("about")
    }
  }
  #endif
  
  #if os(iOS)
  var sidebarView: some View {
    NavigationSplitView {
      sidebarContent
    } detail: {
      NavigationStack {
        if let selectionSidebarMenu {
          switch selectionSidebarMenu {
          case .watchNow:
            HomeView(presenter: Resolver.resolve())
          case .favorite:
            FavoriteView(presenter: Resolver.resolve())
          case .search:
            SearchView(presenter: Resolver.resolve())
          case .account:
            AboutView(presenter: Resolver.resolve())
          }
        }
      }
    }
  }
  #endif
  
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
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
