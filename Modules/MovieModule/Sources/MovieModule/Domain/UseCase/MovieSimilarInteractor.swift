//
//  MovieSimilarInteractor.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias MovieSimilarRepository = GetMovieSimilarRepository<GetMovieSimilarRemoteDataSource, MovieMapper>
public typealias MovieSimilarInteractor = Interactor<Int, [MovieUIModel], MovieSimilarRepository>
