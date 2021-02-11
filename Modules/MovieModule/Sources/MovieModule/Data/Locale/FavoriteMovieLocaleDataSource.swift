//
//  File.swift
//  
//
//  Created by Ari Supriatna on 10/02/21.
//

import Combine
import RiMovieCore
import RealmSwift

public struct FavoriteMovieLocaleDataSource: LocaleDataSource {
  
  public typealias Request = Int
  public typealias Response = MovieEntity
  
  private let _realm: Realm?
  
  public init(realm: Realm?) {
    _realm = realm
  }
  
  public func add(entities: MovieEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = _realm {
        do {
          try realm.write {
            realm.add(entities, update: .all)
            
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  public func get(id: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      if let realm = _realm {
        let movieEntity: Results<MovieEntity> = {
          realm.objects(MovieEntity.self)
            .filter("id = \(id)")
        }()
        
        guard let movie = movieEntity.first else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        
        completion(.success(movie))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  public func update(id: Int) -> AnyPublisher<MovieEntity, Error> {
    return Future<MovieEntity, Error> { completion in
      if let realm = _realm, let movieEntity = {
        realm.objects(MovieEntity.self).filter("id = \(id)")
      }().first {
        do {
          try realm.write {
            movieEntity.setValue(!movieEntity.favorite, forKey: "favorite")
          }
          completion(.success(movieEntity))
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
  public func list(request: Int?) -> AnyPublisher<[MovieEntity], Error> {
    return Future<[MovieEntity], Error> { completion in
      if let realm = _realm {
        let movieEntities = {
          realm.objects(MovieEntity.self)
            .filter("favorite = \(true)")
            .sorted(byKeyPath: "title", ascending: true)
        }()
        completion(.success(movieEntities.toArray(ofType: MovieEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }
  
}
