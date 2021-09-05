//
//  Utilities.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit

class Utilities {
  static let shared = Utilities()

  func setupHomeScreen() {
    let sceneDelegate = SceneDelegate.shared
    if let window = sceneDelegate?.window {
      let navigationController = UINavigationController(rootViewController: TabBarViewController())
      window.rootViewController = navigationController
      window.makeKeyAndVisible()
    }
  }
}
