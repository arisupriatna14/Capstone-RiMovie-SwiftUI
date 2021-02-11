//
//  MovieFavoruteInteractor.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias MovieFavoriteRepository = GetMovieFavoriteRepository<FavoriteMovieLocaleDataSource, MovieDetailMapper>
public typealias MovieFavoriteInteractor = Interactor<Int, MovieUIModel, MovieFavoriteRepository>
