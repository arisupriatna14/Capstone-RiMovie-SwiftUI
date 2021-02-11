//
//  MoviesInteractor.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias MoviesRepository = GetMoviesRepository<GetMoviesRemoteDataSource, MovieMapper>
public typealias MoviesInteractor = Interactor<Endpoints.Gets, [MovieUIModel], MoviesRepository>
