//
//  CardsCollectionCell.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit

class CardsCollectionCell: UICollectionViewCell {
  lazy var clockImageView = UIImageView()
  lazy var timeLabel = UILabel()
  lazy var statusImageView = UIImageView()
  lazy var cardTitleLabel = UILabel()
  lazy var cardDescriptionLabel = UILabel()
  lazy var avatarImageView = UIImageView()
  lazy var nameLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension CardsCollectionCell {
  func configureViews() {
    contentView.backgroundColor = .white
    contentView.layer.cornerRadius = 5
    contentView.layer.shadowColor = UIColor.gray.cgColor
    contentView.layer.shadowOpacity = 0.8
    contentView.layer.shadowOffset = CGSize(width: 1, height: 1)

    clockImageView = {
      let imageView = UIImageView(image: UIImage(named: "clock"))
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    timeLabel = {
      let label = UILabel()
      label.text = "8:30 AM - 02:00 PM"
      label.font = UIFont.systemFont(ofSize: 10)
      label.textColor = #colorLiteral(red: 0.1490196078, green: 0.4549019608, blue: 0.8549019608, alpha: 1)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    statusImageView = {
      let imageView = UIImageView(image: UIImage(named: "event-status"))
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    cardTitleLabel = {
      let label = UILabel()
      label.text = "Teeth Drilling"
      label.font = UIFont.systemFont(ofSize: 16, weight: .black)
      label.textColor = #colorLiteral(red: 0.2509803922, green: 0.3019607843, blue: 0.4, alpha: 1)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    cardDescriptionLabel = {
      let label = UILabel()
      label.text = "The dentist has to drill a Arthur’s tooth cavity because the cavity (the hole in the tooth) is not just an empty space - it is actually filled with decayed tooth material."
      label.numberOfLines = 0
      label.lineBreakMode = .byWordWrapping
      label.font = UIFont.systemFont(ofSize: 10)
      label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5764705882, blue: 0.6823529412, alpha: 1)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    avatarImageView = {
      let image = UIImage(named: "Ellipse")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 11
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    nameLabel = {
      let label = UILabel()
      label.text = "Arthur Clayton"
      label.font = UIFont.systemFont(ofSize: 10)
      label.textColor = #colorLiteral(red: 0.2509803922, green: 0.3019607843, blue: 0.4, alpha: 1)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
  }

  func configureConstraints() {
    contentView.addSubview(clockImageView)
    contentView.addSubview(timeLabel)
    contentView.addSubview(statusImageView)
    contentView.addSubview(cardTitleLabel)
    contentView.addSubview(cardDescriptionLabel)
    contentView.addSubview(avatarImageView)
    contentView.addSubview(nameLabel)

    NSLayoutConstraint.activate([
      clockImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
      clockImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
      clockImageView.heightAnchor.constraint(equalToConstant: 11),
      clockImageView.widthAnchor.constraint(equalToConstant: 11),

      timeLabel.centerYAnchor.constraint(equalTo: clockImageView.centerYAnchor),
      timeLabel.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 7),
      timeLabel.heightAnchor.constraint(equalToConstant: 17),

      statusImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      statusImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),
      statusImageView.heightAnchor.constraint(equalToConstant: 21),
      statusImageView.widthAnchor.constraint(equalToConstant: 69),

      cardTitleLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
      cardTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
      cardTitleLabel.heightAnchor.constraint(equalToConstant: 20),

      cardDescriptionLabel.topAnchor.constraint(equalTo: cardTitleLabel.bottomAnchor, constant: 9),
      cardDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
      cardDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -21),

      avatarImageView.topAnchor.constraint(equalTo: cardDescriptionLabel.bottomAnchor, constant: 10),
      avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 27),
      avatarImageView.heightAnchor.constraint(equalToConstant: 22),
      avatarImageView.widthAnchor.constraint(equalToConstant: 22),

      nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 9)
    ])
  }
}
