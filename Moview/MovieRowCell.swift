//
//  MovieRowCell.swift
//  Moview
//
//  Created by Elizeu RS on 17/06/22.
//

import UIKit
import SDWebImage

class MoviewRowCell: UICollectionViewCell  {
  
  var movie: Movie! {
    didSet {
      imageView.sd_setImage(with: URL(string: movie.posterPath))
      nameLabel.text = movie?.title
      yearLabel.text = movie?.release_date
      overview.text = movie?.overview
    }
  }
  
  let imageView =  UIImageView()
  let nameLabel = UILabel()
  let yearLabel = UILabel()
  let overview = UILabel()
  let HStackView = UIStackView()
  let VStackView = UIStackView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MoviewRowCell {
  private func setup() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "filmPoster")
//    imageView.backgroundColor = .systemPurple
    imageView.layer.cornerRadius = 15
    imageView.clipsToBounds = true
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    nameLabel.adjustsFontForContentSizeCategory = true
    nameLabel.text = "The Movie The Movie The Movie"
    nameLabel.numberOfLines = 0
    
    yearLabel.translatesAutoresizingMaskIntoConstraints = false
    yearLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    yearLabel.text = "2022"
    
    overview.translatesAutoresizingMaskIntoConstraints = false
    overview.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    overview.text = "Astronauts who have seen the Earth from space have often described the 'Overview Effect', an experience that has transformed their perspective of the planet and mankind's place upon it, and enabled them to perceive it as our shared home, without boundaries between nations or species."
    overview.numberOfLines =  0
    
//    VStackView.translatesAutoresizingMaskIntoConstraints = false
//    VStackView.axis = .vertical
//    VStackView.spacing = 40
//    VStackView.alignment = .fill
//
//    VStackView.addSubview(nameLabel)
//    VStackView.addSubview(yearLabel)
//    VStackView.addSubview(overview)
//
//    addSubview(VStackView)
    
    let stackView = UIStackView(arrangedSubviews: [imageView,
    VerticalStackView(arrangedSubviews: [nameLabel, yearLabel, overview], spacing: 4)])
    stackView.spacing = 16
    
    stackView.alignment = .center
    
    addSubview(stackView)
    stackView.fillSuperview(padding: .init(top: 30, left: 0, bottom: 0, right: 30))
  
  }
  
  private func layout() {
    
    NSLayoutConstraint.activate([
      imageView.widthAnchor.constraint(equalToConstant: 100),
      imageView.heightAnchor.constraint(equalToConstant: 160)
    ])
    
  }
}


