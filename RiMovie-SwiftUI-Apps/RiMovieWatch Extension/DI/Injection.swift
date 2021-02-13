//
//  Injection.swift
//  RiMovieWatch Extension
//
//  Created by Ari Supriatna on 11/02/21.
//

import Foundation
import Resolver
import MovieModule
import RiMovieCore

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerCoreServices()
    registerMoviesServices()
    registerDetailMovieServices()
  }
}

extension Resolver {
  static func registerCoreServices() {
    register {
      MovieMapper()
    }
    
    register {
      MovieDetailMapper()
    }
    
    register {
      GetMoviesRemoteDataSource()
    }
    
    register {
      GetMovieRemoteDataSource(endpoint: Endpoints.Gets.detail.url)
    }
    
    register {
      MoviesRepository(remote: resolve(), mapper: resolve())
    }
    
    register {
      MovieRepository(remote: resolve(), mapper: resolve())
    }
  }
  
  static func registerMoviesServices() {
    register {
      MoviesPresenter<MoviesInteractor>(moviesUseCase: resolve())
    }
    
    register {
      MoviesInteractor(repository: resolve())
    }
  }
  
  static func registerDetailMovieServices() {
    register {
      GetItemPresenter<Int, MovieUIModel, MovieInteractor>(useCase: resolve())
    }
    
    register {
      MovieInteractor(repository: resolve())
    }
  }
}
