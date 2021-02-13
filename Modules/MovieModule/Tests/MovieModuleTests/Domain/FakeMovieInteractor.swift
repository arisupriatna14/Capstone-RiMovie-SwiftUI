//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeMovieRepository = GetMovieRepository<FakeGetMovieRemoteDataSource, MovieDetailMapper>
typealias FakeMovieInteractor = Interactor<Int, MovieUIModel, FakeMovieRepository>
