//
//  MoviesSearchController.swift
//  Moview
//
//  Created by Elizeu RS on 19/06/22.
//

import UIKit

class MoviesSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  fileprivate let cellId = "id1234"
  fileprivate var movies = [Movie]()
  
  var timer: Timer?
  
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate let searchController = UISearchController(searchResultsController: nil)
  
  fileprivate let enterSearchTermLabel: UILabel = {
    let label = UILabel()
    label.text = "Please enter search term above..."
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "Search"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    setupCollectionView()
    setupSearchBar()
  }

}

extension MoviesSearchController: UISearchBarDelegate {
  fileprivate func setupSearchBar() {
    definesPresentationContext = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.delegate = self
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print(searchText)
    
    timer?.invalidate()
    
    timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
      
      Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
        if let err = err {
          print("Failed to fetch movies:", err)
          return
        }
        
        self.movies = res?.results ?? []
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    })
  }
}

extension MoviesSearchController  {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 180)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    enterSearchTermLabel.isHidden = movies.count != 0
    return movies.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoviewRowCell
    
    cell.movie = self.movies[indexPath.item]
    
    return cell
  }
}

extension MoviesSearchController {
  private func setupCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.register(MoviewRowCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.contentInset = .init(top: 0, left: 32, bottom: 0, right: 0)
    
    collectionView.addSubview(enterSearchTermLabel)
    enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 16, bottom: 0, right: 16))
  }

}
