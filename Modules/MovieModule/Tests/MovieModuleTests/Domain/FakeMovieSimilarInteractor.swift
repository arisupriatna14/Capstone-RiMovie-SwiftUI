//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import RiMovieCore
import MovieModule

typealias FakeMovieSimilarRepository = GetMovieSimilarRepository<
  FakeGetMovieSimilarRemoteDataSource,
  MovieMapper
>

typealias FakeMovieSimilarInteractor = Interactor<Int, [MovieUIModel], FakeMovieSimilarRepository>
