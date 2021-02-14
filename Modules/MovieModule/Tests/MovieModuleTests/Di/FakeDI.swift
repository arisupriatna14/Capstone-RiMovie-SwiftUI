//
//  File.swift
//  
//
//  Created by Ari Supriatna on 13/02/21.
//

import Resolver
import MovieModule

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerAllRemoteDataSourceServices()
    registerAllLocaleDataSourceServices()
    registerAllRepositoryServices()
    registerAllInteractorServices()
  }
}

extension Resolver {

  static func registerAllRemoteDataSourceServices() {
    register {
      FakeGetMoviesRemoteDataSource()
    }
    
    register {
      FakeGetMovieRemoteDataSource()
    }
    
    register {
      FakeGetMovieSimilarRemoteDataSource()
    }
  }
  
  static func registerAllLocaleDataSourceServices() {
    register {
      FakeFavoriteMovieLocaleDataSource()
    }
  }
  
  static func registerAllRepositoryServices() {
    register {
      FakeMoviesRepository(remote: resolve(), mapper: MovieMapper())
    }
    
    register {
      FakeMovieRepository(remote: resolve(), mapper: MovieDetailMapper())
    }
    
    register {
      FakeUpdateFavoriteRepository(locale: resolve(), mapper: MovieDetailMapper())
    }
    
    register {
      FakeAddFavoriteRepository(locale: resolve(), mapper: MovieDetailMapper())
    }
    
    register {
      FakeMovieFavoriteRepository(locale: resolve(), mapper: MovieDetailMapper())
    }
    
    register {
      FakeMoviesFavoriteRepository(locale: resolve(), mapper: MovieMapper())
    }
    
    register {
      FakeMovieSimilarRepository(remote: resolve(), mapper: MovieMapper())
    }
  }
  
  static func registerAllInteractorServices() {
    register {
      FakeMoviesInteractor(repository: resolve())
    }
    
    register {
      FakeMovieInteractor(repository: resolve())
    }
    
    register {
      FakeUpdateMovieFavoriteInteractor(repository: resolve())
    }
    
    register {
      FakeAddMovieFavoriteInteractor(repository: resolve())
    }
    
    register {
      FakeMovieFavoriteInteractor(repository: resolve())
    }
    
    register {
      FakeMoviesFavoriteInteractor(repository: resolve())
    }
    
    register {
      FakeMovieSimilarInteractor(repository: resolve())
    }
  }
  
}
