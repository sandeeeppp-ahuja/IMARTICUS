//
//  LocationSearchViewController.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 05/09/21.
//

import UIKit
import FloatingPanel

class LocationSearchViewController: UIViewController, FloatingPanelControllerDelegate {
  // MARK: - Properties
  lazy var searchBar = UITextField()
  lazy var backButton = UIButton()
  lazy var backgroundImageView = UIImageView()

  var fpc: FloatingPanelController!

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    configureConstraints()
    setupFloatingPanel()
    // Do any additional setup after loading the view.
  }

  func setupFloatingPanel() {
    fpc = FloatingPanelController()
    fpc.delegate = self
    let contentVC = LocationsListViewController()
    fpc.set(contentViewController: contentVC)
    fpc.addPanel(toParent: self)
  }

  // MARK: - Actions
  @objc func backButtonTapped() {
    navigationController?.popViewController(animated: true)
  }

}

extension LocationSearchViewController {
  func configureViews() {
    view.backgroundColor = .white
    searchBar = {
      let textField = UITextField()
      textField.placeholder = "Search by address"
      textField.textColor = .gray
      textField.layer.cornerRadius = 22
      textField.layer.borderWidth = 1
      textField.layer.borderColor = UIColor.lightGray.cgColor
      textField.setLeftPaddingPoints(10)
      textField.translatesAutoresizingMaskIntoConstraints = false
      return textField
    }()

    backButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "back-black"), for: .normal)
      button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    backgroundImageView = {
      let imageView = UIImageView()
      imageView.image = UIImage(named: "map")
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
  }

  func configureConstraints() {
    view.addSubview(backgroundImageView)
    view.addSubview(backButton)
    view.addSubview(searchBar)


    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
      backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      backButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      backButton.heightAnchor.constraint(equalToConstant: 15),
      backButton.widthAnchor.constraint(equalToConstant: 21),

      searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 47),
      searchBar.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
      searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      searchBar.heightAnchor.constraint(equalToConstant: 45),

    ])
  }
}
