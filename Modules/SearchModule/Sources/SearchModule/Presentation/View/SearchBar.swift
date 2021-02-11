//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

//import SwiftUI
//
//public struct SearchBar<Content>: UIViewControllerRepresentable where Content: View {
//
//  @Binding public var text: String
//  public var content: () -> Content
//
//  public init(@ViewBuilder content: @escaping () -> Content) {
//    self.content = content
//  }
//
//  public func makeUIViewController(context: Context) -> UINavigationController {
//    let navigationController = UINavigationController(rootViewController: context.coordinator.rootViewController)
//    navigationController.navigationBar.prefersLargeTitles = true
//    navigationController.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
//
//    context.coordinator.searchController.searchBar.delegate = context.coordinator
//
//    return navigationController
//  }
//
//  public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
//    context.coordinator.update(content: content())
//  }
//
//  public func makeCoordinator() -> Coordinator {
//    Coordinator(content: content(), searchText: $text)
//  }
//
//  public class Coordinator: NSObject, UISearchBarDelegate {
//    @Binding public var text: String
//    public let rootViewController: UIHostingController<Content>
//    public let searchController = UISearchController(searchResultsController: nil)
//
//    public init(content: Content, searchText: Binding<String>) {
//      rootViewController = UIHostingController(rootView: content)
//      searchController.searchBar.autocapitalizationType = .none
//      searchController.obscuresBackgroundDuringPresentation = false
//      rootViewController.navigationItem.searchController = searchController
//
//      _text = searchText
//    }
//
//    public func update(content: Content) {
//      rootViewController.rootView = content
//      rootViewController.view.setNeedsDisplay()
//    }
//
//    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//      text = searchText
//    }
//
//    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//      searchBar.resignFirstResponder()
//    }
//
//    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//      text = ""
//    }
//  }
//}
