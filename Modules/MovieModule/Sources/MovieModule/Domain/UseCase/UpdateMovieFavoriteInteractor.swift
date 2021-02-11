//
//  UpdateMovieFavoriteInteractor.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias UpdateFavoriteRepository = UpdateMovieFavoriteRepository<
  FavoriteMovieLocaleDataSource,
  MovieDetailMapper
>

public typealias UpdateMovieFavoriteInteractor = Interactor<
  Int,
  MovieUIModel,
  UpdateFavoriteRepository
>
