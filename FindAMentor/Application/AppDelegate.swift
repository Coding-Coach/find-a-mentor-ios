//
//  AppDelegate.swift
//  FindAMentor
//
//  Created by Riccardo Cipolleschi on 18/03/2020.
//  Copyright © 2020 Riccardo Cipolleschi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let window = UIWindow()
    let vc = UIViewController()
    vc.view.backgroundColor = .red
    window.rootViewController = vc
    self.window = window

    self.window?.makeKeyAndVisible()

    return true
  }

}

