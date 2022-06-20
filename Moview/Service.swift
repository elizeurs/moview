//
//  Service.swift
//  Moview
//
//  Created by Elizeu RS on 20/06/22.
//

import Foundation

class Service {
  
  static let shared = Service()
  
  func fetchMovieDetail(completion: @escaping(MovieResponse?, Error) -> ()) {
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=1"
  }
  
  func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
      if let err = err {
        completion(nil, err)
        return
      }
      do {
        let objects = try JSONDecoder().decode(T.self, from: data!)
        // success
        completion(objects, nil)
      } catch {
        completion(nil, error)
      }
    }.resume()
  }
}
