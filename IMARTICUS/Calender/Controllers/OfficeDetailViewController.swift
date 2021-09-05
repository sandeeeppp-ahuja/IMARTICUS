//
//  OfficeDetailViewController.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit

class OfficeDetailViewController: UIViewController {
  // MARK: - Properties
  lazy var topView = UIView()
  lazy var bottomView = UIView()
  lazy var backButton = UIButton()
  lazy var titleLabel = UILabel()
  lazy var searchButton = UIButton()
  lazy var menuButton = UIButton()
  lazy var officeNameLabel = UILabel()
  lazy var patientCountLabel = UILabel()
  lazy var centerTimeImageView = UIImageView()
  lazy var cardsCollectionView = UICollectionView()

  private let viewModel: CalendarViewModel

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
    configureViews()
    configureConstraints()
  }

  // MARK: - Actions
  @objc func backButtonTapped() {
    navigationController?.popViewController(animated: true)
  }

  @objc func searchButtonTapped() {
    print("Search Tapped")
  }

  @objc func menuButtonTapped() {
    print("Menu Tapped")
  }
}

extension OfficeDetailViewController {
  func configureViews() {
    view.backgroundColor = .white

    topView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.4745098039, blue: 0.9019607843, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    bottomView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.04705882353, green: 0.2666666667, blue: 0.5725490196, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    backButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "back"), for: .normal)
      button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    titleLabel = {
      let label = UILabel()
      label.text = "Today"
      label.textColor = .white
      label.font = UIFont.systemFont(ofSize: 18, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    searchButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "search"), for: .normal)
      button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    menuButton = {
      let button = UIButton()
      button.setImage(UIImage(named: "menu"), for: .normal)
      button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    officeNameLabel = {
      let label = UILabel()
      label.text = "Office No. 248"
      label.textColor = .white
      label.font = UIFont.systemFont(ofSize: 18, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    patientCountLabel = {
      let label = UILabel()
      label.text = "3 patients"
      label.textColor = #colorLiteral(red: 0.7607843137, green: 0.8666666667, blue: 1, alpha: 1)
      label.font = UIFont.systemFont(ofSize: 12)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    centerTimeImageView = {
      let imageView = UIImageView(image: UIImage(named: "Group"))
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    cardsCollectionView = {
      let flowLayout = UICollectionViewFlowLayout()
      flowLayout.scrollDirection = .horizontal
      let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
      collectionView.backgroundColor = .clear
      collectionView.isPagingEnabled = true
      collectionView.isScrollEnabled = true
      collectionView.delegate = self
      collectionView.dataSource = self
      collectionView.showsHorizontalScrollIndicator = false
      collectionView.register(CardsCollectionCell.self, forCellWithReuseIdentifier: "CardsCollectionCell")
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
  }

  func configureConstraints() {
    view.addSubview(topView)
    view.addSubview(bottomView)
    view.addSubview(backButton)
    view.addSubview(titleLabel)
    view.addSubview(searchButton)
    view.addSubview(menuButton)
    view.addSubview(officeNameLabel)
    view.addSubview(patientCountLabel)
    view.addSubview(centerTimeImageView)
    view.addSubview(cardsCollectionView)

    NSLayoutConstraint.activate([
      topView.topAnchor.constraint(equalTo: view.topAnchor),
      topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      topView.heightAnchor.constraint(equalToConstant: 340),

      bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
      bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),

      backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
      backButton.heightAnchor.constraint(equalToConstant: 15),
      backButton.widthAnchor.constraint(equalToConstant: 21),

      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.heightAnchor.constraint(equalToConstant: 23),

      menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
      menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      menuButton.heightAnchor.constraint(equalToConstant: 15),
      menuButton.widthAnchor.constraint(equalToConstant: 16),

      searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
      searchButton.trailingAnchor.constraint(equalTo: menuButton.leadingAnchor, constant: -25),
      searchButton.heightAnchor.constraint(equalToConstant: 15),
      searchButton.widthAnchor.constraint(equalToConstant: 15),

      officeNameLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 45),
      officeNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 34),
      officeNameLabel.heightAnchor.constraint(equalToConstant: 23),

      patientCountLabel.topAnchor.constraint(equalTo: officeNameLabel.bottomAnchor),
      patientCountLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 35),
      patientCountLabel.heightAnchor.constraint(equalToConstant: 17),

      centerTimeImageView.centerYAnchor.constraint(equalTo: topView.bottomAnchor),
      centerTimeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      centerTimeImageView.heightAnchor.constraint(equalToConstant: 308),
      centerTimeImageView.widthAnchor.constraint(equalToConstant: 308),

      cardsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      cardsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      cardsCollectionView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: 26),
      cardsCollectionView.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
}

extension OfficeDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.numberOfCellsForOfficeCollectionView
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: "CardsCollectionCell",
      for: indexPath
    ) as! CardsCollectionCell
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

extension OfficeDetailViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 305, height: 180)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
  }
}
