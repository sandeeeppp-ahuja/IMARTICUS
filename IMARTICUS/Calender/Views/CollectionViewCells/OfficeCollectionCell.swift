//
//  OfficeCollectionCell.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 04/09/21.
//

import UIKit

class OfficeCollectionCell: UICollectionViewCell {
  lazy var cellView = UIView()
  lazy var officeNumberLabel = UILabel()
  lazy var patientCountLabel = UILabel()
  lazy var clockImageView = UIImageView()
  lazy var timeLabel = UILabel()
  lazy var avatarImageView1 = UIImageView()
  lazy var avatarImageView2 = UIImageView()
  lazy var avatarImageView3 = UIImageView()
  lazy var checkImageView = UIImageView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OfficeCollectionCell {
  func configureViews() {
    contentView.backgroundColor = #colorLiteral(red: 0.4, green: 0.6666666667, blue: 1, alpha: 1)

    cellView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.4117647059, blue: 0.7803921569, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    officeNumberLabel = {
      let label = UILabel()
      label.text = "Office No 248"
      label.font = UIFont.systemFont(ofSize: 14, weight: .black)
      label.textColor = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    patientCountLabel = {
      let label = UILabel()
      label.text = "/ 3 patients"
      label.font = UIFont.systemFont(ofSize: 14)
      label.textColor = .white
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    clockImageView = {
      let imageView = UIImageView(image: UIImage(named: "clock"))
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    timeLabel = {
      let label = UILabel()
      label.text = "8:30 AM - 02:00 PM"
      label.font = UIFont.systemFont(ofSize: 12)
      label.textColor = #colorLiteral(red: 0.7607843137, green: 0.8666666667, blue: 1, alpha: 1)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    avatarImageView1 = {
      let image = UIImage(named: "Ellipse")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 11
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    avatarImageView2 = {
      let image = UIImage(named: "Ellipse")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 11
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    avatarImageView3 = {
      let image = UIImage(named: "Ellipse")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 11
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    checkImageView = {
      let image = UIImage(named: "verified")
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.layer.cornerRadius = 12
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()
  }

  func configureConstraints() {
    contentView.addSubview(cellView)
    cellView.addSubview(officeNumberLabel)
    cellView.addSubview(patientCountLabel)
    cellView.addSubview(clockImageView)
    cellView.addSubview(timeLabel)
    cellView.addSubview(avatarImageView1)
    cellView.addSubview(avatarImageView2)
    cellView.addSubview(avatarImageView3)
    cellView.addSubview(checkImageView)

    NSLayoutConstraint.activate([
      cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
      cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

      officeNumberLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),
      officeNumberLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
      officeNumberLabel.heightAnchor.constraint(equalToConstant: 18),

      patientCountLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),
      patientCountLabel.leadingAnchor.constraint(equalTo: officeNumberLabel.trailingAnchor, constant: 5),
      patientCountLabel.heightAnchor.constraint(equalToConstant: 18),

      clockImageView.topAnchor.constraint(equalTo: officeNumberLabel.bottomAnchor, constant: 7),
      clockImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
      clockImageView.heightAnchor.constraint(equalToConstant: 14),
      clockImageView.widthAnchor.constraint(equalToConstant: 14),

      timeLabel.centerYAnchor.constraint(equalTo: clockImageView.centerYAnchor),
      timeLabel.leadingAnchor.constraint(equalTo: clockImageView.trailingAnchor, constant: 6),
      timeLabel.heightAnchor.constraint(equalToConstant: 17),

      avatarImageView1.topAnchor.constraint(equalTo: clockImageView.bottomAnchor, constant: 12),
      avatarImageView1.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
      avatarImageView1.heightAnchor.constraint(equalToConstant: 22),
      avatarImageView1.widthAnchor.constraint(equalToConstant: 22),

      avatarImageView2.topAnchor.constraint(equalTo: clockImageView.bottomAnchor, constant: 12),
      avatarImageView2.leadingAnchor.constraint(equalTo: avatarImageView1.trailingAnchor, constant: 6),
      avatarImageView2.heightAnchor.constraint(equalToConstant: 22),
      avatarImageView2.widthAnchor.constraint(equalToConstant: 22),

      avatarImageView3.topAnchor.constraint(equalTo: clockImageView.bottomAnchor, constant: 12),
      avatarImageView3.leadingAnchor.constraint(equalTo: avatarImageView2.trailingAnchor, constant: 6),
      avatarImageView3.heightAnchor.constraint(equalToConstant: 22),
      avatarImageView3.widthAnchor.constraint(equalToConstant: 22),

      checkImageView.topAnchor.constraint(equalTo: clockImageView.bottomAnchor, constant: 12),
      checkImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -14),
      checkImageView.heightAnchor.constraint(equalToConstant: 24),
      checkImageView.widthAnchor.constraint(equalToConstant: 24),
    ])
  }
}
