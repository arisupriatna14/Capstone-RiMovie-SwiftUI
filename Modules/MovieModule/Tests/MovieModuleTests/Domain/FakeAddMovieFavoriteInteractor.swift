//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeAddFavoriteRepository = AddMovieFavoriteRepository<FakeFavoriteMovieLocaleDataSource, MovieDetailMapper>
typealias FakeAddMovieFavoriteInteractor = Interactor<MovieUIModel, Bool, FakeAddFavoriteRepository>
