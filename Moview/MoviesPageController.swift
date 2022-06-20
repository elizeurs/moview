//
//  MoviesPageController.swift
//  Moview
//
//  Created by Elizeu RS on 17/06/22.
//

import UIKit

class MoviesPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  
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
  }
}

extension MoviesPageController {
  private func setupCollectionView() {
    // #colorLiteral(
    collectionView.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
    collectionView.register(MoviewRowCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.contentInset = .init(top: 0, left: 32, bottom: 0, right: 0)
    
  }
}

extension MoviesPageController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MoviewRowCell
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return .init(width: view.frame.width, height: 200)
  }
}


