//
//  CalendarViewController.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit
import DropDown

class CalendarViewController: UIViewController {
  // MARK: - Properties
  lazy var topView = UIView()
  lazy var searchBar = UITextField()
  lazy var avatarImageView = UIImageView()
  lazy var patientNameLabel = UILabel()
  lazy var patientCountLabel = UILabel()
  lazy var dropDownView = UIView()
  lazy var dropDownLabel = UILabel()
  lazy var dropDownImage = UIImageView()
  lazy var officeCollectionView = UICollectionView()

  private let viewModel: CalendarViewModel

  var dropDown: DropDown?

  // MARK: - LifeCycle
  init(viewModel: CalendarViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = true
    configureViews()
    configureConstraints()
    setupView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  // MARK: - Helpers
  func setupView() {
    let dropDownGesture = UITapGestureRecognizer(target: self, action: #selector(openDropDown))
    dropDownView.addGestureRecognizer(dropDownGesture)

    setupDropDown()
  }

  func setupDropDown() {
    dropDown = DropDown()
    dropDown?.anchorView = dropDownView
    dropDown?.dataSource = viewModel.days

    dropDown?.selectionAction = { (index: Int, item: String) in
      self.dropDownLabel.text = item
    }

  }

  // MARK: - Actions

  @objc func openDropDown() {
    print("Drop down")
    dropDown?.show()
  }
}

extension CalendarViewController {
  func configureViews() {
    view.backgroundColor = .white

    topView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.4745098039, blue: 0.9019607843, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    searchBar = {
      let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
          string: "Search",
          attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
      textField.textColor = .white
      textField.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.5450980392, blue: 1, alpha: 1)
      textField.layer.cornerRadius = 22
      textField.setLeftPaddingPoints(10)
      textField.delegate = self
      textField.translatesAutoresizingMaskIntoConstraints = false
      return textField
    }()

    avatarImageView = {
      let image = UIImage(named: "Ellipse")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 20
      imageView.layer.borderWidth = 1
      imageView.layer.borderColor = UIColor.white.cgColor
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    patientNameLabel = {
      let label = UILabel()
      label.text = "My Patients"
      label.textColor = .white
      label.font = UIFont.systemFont(ofSize: 18, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    patientCountLabel = {
      let label = UILabel()
      label.text = "12 Total"
      label.textColor = #colorLiteral(red: 0.7607843137, green: 0.8666666667, blue: 1, alpha: 1)
      label.font = UIFont.systemFont(ofSize: 12)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    dropDownView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.5450980392, blue: 1, alpha: 1)
      view.layer.cornerRadius = 5
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    dropDownLabel = {
      let label = UILabel()
      label.text = "Today"
      label.textColor = .white
      label.font = UIFont.systemFont(ofSize: 12, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    dropDownImage = {
      let imageView = UIImageView(image: UIImage(named: "dropDown"))
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    officeCollectionView = {
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.scrollDirection = .horizontal
      let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
      collectionView.backgroundColor = .clear
      collectionView.isPagingEnabled = true
      collectionView.isScrollEnabled = true
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.showsHorizontalScrollIndicator = false
      collectionView.register(OfficeCollectionCell.self, forCellWithReuseIdentifier: "OfficeCollectionCell")
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
  }

  func configureConstraints() {
    view.addSubview(topView)
    topView.addSubview(searchBar)
    topView.addSubview(avatarImageView)
    topView.addSubview(patientNameLabel)
    topView.addSubview(patientCountLabel)
    topView.addSubview(dropDownView)
    dropDownView.addSubview(dropDownLabel)
    dropDownView.addSubview(dropDownImage)
    view.addSubview(officeCollectionView)

    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: view.topAnchor),
      topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: 290),

      searchBar.topAnchor.constraint(equalTo: topView.topAnchor, constant: 47),
      searchBar.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 35),
      searchBar.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -10),
      searchBar.heightAnchor.constraint(equalToConstant: 45),

      avatarImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
      avatarImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -37),
      avatarImageView.heightAnchor.constraint(equalToConstant: 40),
      avatarImageView.widthAnchor.constraint(equalToConstant: 40),

      patientNameLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 38),
      patientNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 34),
      patientNameLabel.heightAnchor.constraint(equalToConstant: 23),

      patientCountLabel.topAnchor.constraint(equalTo: patientNameLabel.bottomAnchor),
      patientCountLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 35),
      patientCountLabel.heightAnchor.constraint(equalToConstant: 17),

      dropDownView.topAnchor.constraint(equalTo: patientNameLabel.topAnchor),
      dropDownView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -35),
      dropDownView.heightAnchor.constraint(equalToConstant: 32),
      dropDownView.widthAnchor.constraint(equalToConstant: 85),

      dropDownLabel.centerYAnchor.constraint(equalTo: dropDownView.centerYAnchor),
      dropDownLabel.leadingAnchor.constraint(equalTo: dropDownView.leadingAnchor, constant: 13),
      dropDownLabel.trailingAnchor.constraint(equalTo: dropDownImage.leadingAnchor, constant: 2),

      dropDownImage.centerYAnchor.constraint(equalTo: dropDownView.centerYAnchor),
      dropDownImage.trailingAnchor.constraint(equalTo: dropDownView.trailingAnchor, constant: -5),
      dropDownImage.heightAnchor.constraint(equalToConstant: 7),
      dropDownImage.widthAnchor.constraint(equalToConstant: 10),

      officeCollectionView.centerYAnchor.constraint(equalTo: topView.bottomAnchor),
      officeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      officeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      officeCollectionView.heightAnchor.constraint(equalToConstant: 105)
    ])
  }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfCellsForOfficeCollectionView
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "OfficeCollectionCell",
      for: indexPath
    ) as! OfficeCollectionCell
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let viewController = OfficeDetailViewController(viewModel: viewModel)
    navigationController?.pushViewController(viewController, animated: true)
  }
}

extension CalendarViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let height = collectionView.frame.height
    return CGSize(width: 240, height: height)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
  }
}

extension CalendarViewController: UITextFieldDelegate {
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    let viewController = LocationSearchViewController()
    navigationController?.pushViewController(viewController, animated: true)
    return false
  }
}
