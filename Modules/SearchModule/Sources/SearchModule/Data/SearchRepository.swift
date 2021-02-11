//
//  SearchRepository.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Foundation
import RiMovieCore
import MovieModule

public typealias SearchRepository = SearchMovieRepository<SearchMovieRemoteDataSource, MovieMapper>
