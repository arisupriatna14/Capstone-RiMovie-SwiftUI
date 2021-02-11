//
//  File.swift
//  
//
//  Created by Ari Supriatna on 11/02/21.
//

import RiMovieCore

public typealias MovieRepository = GetMovieRepository<GetMovieRemoteDataSource, MovieDetailMapper>
public typealias MovieInteractor = Interactor<Int, MovieUIModel, MovieRepository>
