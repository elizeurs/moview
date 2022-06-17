//
//  BaseTabBarController.swift
//  Moview
//
//  Created by Elizeu RS on 17/06/22.
//

import UIKit

class BaseTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UITabBar.appearance().barTintColor = .systemBackground
    tabBar.tintColor = .label
    setupVCs()
  }
  
  func setupVCs() {
    viewControllers = [
      createNavController(viewController: MoviesPageController(), title: "Movies", imageName: UIImage(systemName: "film")!),
    createNavController(viewController: MoviesSearchController(), title: "Search", imageName: UIImage(systemName: "magnifyingglass")!)
    ]
  }
  
  fileprivate func createNavController(viewController: UIViewController, title: String, imageName: UIImage) -> UIViewController  {
    let navController = UINavigationController(rootViewController: viewController)
    navController.navigationBar.prefersLargeTitles = true
    viewController.navigationItem.title = title
//    viewController.view.backgroundColor = .systemBlue
    navController.tabBarItem.image = imageName
    return navController
  }
}

class MoviesPageController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemGreen
    }
}

class MoviesSearchController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}
