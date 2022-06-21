//
//  MovieResponse.swift
//  Moview
//
//  Created by Elizeu RS on 20/06/22.
//

import Foundation

struct MovieResponse: Decodable {
  let results: [Movie]
}

struct Movie: Decodable {
  var id: Int
  var title: String?
  var overview: String?
  var poster_path: String?
  var release_date: String?
  var posterPath: String {
    if let path = poster_path  {
      return  "http://image.tmdb.org/t/p/original/\(path)"
    } else {
      return ""
    }
  }
}
