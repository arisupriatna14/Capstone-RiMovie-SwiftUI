//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeMovieFavoriteRepository = GetMovieFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieDetailMapper>
typealias FakeMovieFavoriteInteractor = Interactor<Int, MovieUIModel, FakeMovieFavoriteRepository>
