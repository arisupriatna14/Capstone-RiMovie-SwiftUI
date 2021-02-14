//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeMoviesFavoriteRepository = GetMoviesFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieMapper>
typealias FakeMoviesFavoriteInteractor = Interactor<Any, [MovieUIModel], FakeMoviesFavoriteRepository>
