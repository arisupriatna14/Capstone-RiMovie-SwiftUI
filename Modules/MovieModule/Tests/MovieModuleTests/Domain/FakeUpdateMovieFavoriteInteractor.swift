//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeUpdateFavoriteRepository = UpdateMovieFavoriteRepository<
  FakeFavoriteMovieLocaleDataSource,
  MovieDetailMapper
>

typealias FakeUpdateMovieFavoriteInteractor = Interactor<
  Int,
  MovieUIModel,
  FakeUpdateFavoriteRepository
>
