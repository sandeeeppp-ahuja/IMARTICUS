//
//  TabBarViewController.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit

class TabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Create Tab one
    let tabOne = HomeViewController()
    let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "home.png"), selectedImage: UIImage(named: "home.png"))

    tabOne.tabBarItem = tabOneBarItem


    // Create Tab two
    let tabTwo = CalendarViewController(viewModel: CalendarViewModel())
    let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(named: "calendar.png"), selectedImage: UIImage(named: "calendar.png"))

    tabTwo.tabBarItem = tabTwoBarItem

    // Create Tab three
    let tabThree = ClockViewController()
    let tabThreeBarItem = UITabBarItem(title: "", image: UIImage(named: "clock.png"), selectedImage: UIImage(named: "clock.png"))

    tabThree.tabBarItem = tabThreeBarItem

    // Create Tab four
    let tabFour = ProfileViewController()
    let tabFourBarItem = UITabBarItem(title: "", image: UIImage(named: "profile.png"), selectedImage: UIImage(named: "profile.png"))
    tabFour.tabBarItem = tabFourBarItem

    // Create Tab five
    let tabFive = ProfileViewController()
    let tabFiveBarItem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: UIImage(named: ""))

    tabFive.tabBarItem = tabFiveBarItem

    setupMiddleButton()

    self.viewControllers = [tabOne, tabTwo, tabFive, tabThree, tabFour]
    self.selectedIndex = 1
  }

  func setupMiddleButton() {
    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    var menuButtonFrame = menuButton.frame
    menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
    menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    menuButton.frame = menuButtonFrame

    menuButton.backgroundColor = UIColor.red
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    view.addSubview(menuButton)

    menuButton.setImage(UIImage(named: "add-item"), for: .normal)

    view.layoutIfNeeded()
  }
}

