//
//  AppDelegate.swift
//  Moview
//
//  Created by Elizeu RS on 16/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
//  let moviesPageController = MoviesPageController()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemOrange
    window?.rootViewController = MoviesPageController()
    
    return true
  }

  
}

