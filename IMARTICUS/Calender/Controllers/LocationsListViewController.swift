//
//  LocationsListViewController.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 05/09/21.
//

import UIKit

class LocationsListViewController: UIViewController {

  lazy var tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    configureViews()
    configureConstraints()
  }


}

extension LocationsListViewController {
  func configureViews() {
    view.backgroundColor = .white

    tableView = {
      let tableView = UITableView()
      tableView.delegate = self
      tableView.dataSource = self
      tableView.showsVerticalScrollIndicator = false
      tableView.separatorStyle = .none
      tableView.rowHeight = UITableView.automaticDimension
      tableView.register(LocationTableCell.self, forCellReuseIdentifier: "LocationTableCell")
      tableView.isHidden = false
      tableView.keyboardDismissMode = .onDrag
      tableView.translatesAutoresizingMaskIntoConstraints = false
      return tableView
    }()
  }

  func configureConstraints() {
    view.addSubview(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension LocationsListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableCell", for: indexPath) as! LocationTableCell

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 85
  }


}
