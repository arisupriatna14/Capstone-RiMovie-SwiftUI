//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias MoviesFavoriteRepository = GetMoviesFavoriteRepository<FavoriteMovieLocaleDataSource, MovieMapper>
public typealias MoviesFavoriteInteractor = Interactor<Any, [MovieUIModel], MoviesFavoriteRepository>
