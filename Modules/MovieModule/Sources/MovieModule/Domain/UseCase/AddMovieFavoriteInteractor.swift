//
//  AddMovieFavoriteInteractor.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias AddFavoriteRepository = AddMovieFavoriteRepository<FavoriteMovieLocaleDataSource, MovieDetailMapper>
public typealias AddMovieFavoriteInteractor = Interactor<MovieUIModel, Bool, AddFavoriteRepository>
