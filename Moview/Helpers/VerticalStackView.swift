//
//  VerticalStackView.swift
//  Moview
//
//  Created by Elizeu RS on 18/06/22.
//

import UIKit

class VerticalStackView: UIStackView {
  
  init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
    super.init(frame: .zero)
    
    arrangedSubviews.forEach({addArrangedSubview($0)})
    
    self.spacing = spacing
    self.axis = .vertical
  }
  
  required init(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
