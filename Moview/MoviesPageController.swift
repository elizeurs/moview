//
//  MoviesPageController.swift
//  Moview
//
//  Created by Elizeu RS on 17/06/22.
//

import UIKit
import SDWebImage

class MoviesPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "cellId"
  fileprivate let footerId = "footerId"
  
  var movies = [Movie]()
  var isPaginating = false
  var isDonePaginating = false
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Now Playing"
    navigationController?.navigationBar.prefersLargeTitles = true
    setupCollectionView()
    fetchData()
  }
}

extension MoviesPageController {
  private func setupCollectionView() {
    // #colorLiteral(
    collectionView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    collectionView.register(MoviewRowCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.contentInset = .init(top: 0, left: 32, bottom: 0, right: 0)
    
    collectionView.register(MovieLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
    
  }
}

extension MoviesPageController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
//    return 20
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoviewRowCell
    
    cell.movie = self.movies[indexPath.item]
    
    // initiate pagination
    if indexPath.item == movies.count - 1 && !isPaginating {
      print("fetch more data")
      
      isPaginating = true
      
      let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=\(movies.count)"
      Service.shared.fetchGenericJSONData(urlString: urlString) { (movieResponse: MovieResponse?, err) in
        
        if let err = err {
          print("Failed to paginate data:", err)
          return
        }
        
        if movieResponse?.results.count == 0 {
          self.isDonePaginating = true
        }
        
        sleep(2)
        
        self.movies += movieResponse?.results ?? []
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
        self.isPaginating = false
      }
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 200)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
    return footer
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    let height: CGFloat =  isDonePaginating ? 0 : 100
    return .init(width: view.frame.width, height: height)
  }
}

extension MoviesPageController {
  fileprivate func fetchData() {
    let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=e0330d7c6c649fe9f0325ddea7eeae4f&language=en-US&page=1"
    Service.shared.fetchGenericJSONData(urlString: urlString) { (movieResponse: MovieResponse?, err) in
      
      if let err = err {
        print("Failed to paginate data:", err)
        return
      }
      
      self.movies = movieResponse?.results ?? []
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
}


