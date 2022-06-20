//
//  MovieLoadingFooter.swift
//  Moview
//
//  Created by Elizeu RS on 20/06/22.
//

import UIKit

class MovieLoadingFooter: UICollectionReusableView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let aiv = UIActivityIndicatorView(style: .whiteLarge)
    aiv.color = .darkGray
    aiv.startAnimating()
    
    let label = UILabel()
    label.text = "Loading more..."
    label.font = UIFont.systemFont(ofSize: 16)
    label.textAlignment = .center
    
    let stackView = VerticalStackView(arrangedSubviews: [aiv, label], spacing: 8)
    
    addSubview(stackView)
    stackView.centerInSuperview(size: .init(width: 200, height: 0))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
