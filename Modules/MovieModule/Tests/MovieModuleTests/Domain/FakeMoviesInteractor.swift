//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeMoviesRepository = GetMoviesRepository<FakeGetMoviesRemoteDataSource, MovieMapper>
typealias FakeMoviesInteractor = Interactor<Endpoints.Gets, [MovieUIModel], FakeMoviesRepository>
