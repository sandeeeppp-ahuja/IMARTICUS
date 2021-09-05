//
//  LocationTableCell.swift
//  IMARTICUS
//
//  Created by Sandeep Ahuja on 05/09/21.
//

import UIKit

class LocationTableCell: UITableViewCell {

  lazy var dateView = UIView()
  lazy var dateLabel = UILabel()
  lazy var dayTimeLabel = UILabel()
  lazy var addressLabel = UILabel()
  lazy var bottomView = UIView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureViews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LocationTableCell {
  func configureViews() {
    contentView.backgroundColor = #colorLiteral(red: 0.09411764706, green: 0.3568627451, blue: 0.7411764706, alpha: 1)

    dateView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.9215686275, blue: 0.9647058824, alpha: 1)
      view.layer.cornerRadius = 10
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    dateLabel = {
      let label = UILabel()
      label.text = "10"
      label.textColor = #colorLiteral(red: 0.2509803922, green: 0.3019607843, blue: 0.4, alpha: 1)
      label.font = UIFont.systemFont(ofSize: 12, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    bottomView = {
      let view = UIView()
      view.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.5058823529, blue: 0.937254902, alpha: 1)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()

    dayTimeLabel = {
      let label = UILabel()
      label.text = "Friday, 31 May - 8:30 a.m"
      label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      label.font = UIFont.systemFont(ofSize: 12, weight: .black)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    addressLabel = {
      let label = UILabel()
      label.text = "3165 Griffin Lodge Suite 462"
      label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      label.font = UIFont.systemFont(ofSize: 11)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
  }

  func configureConstraints() {
    contentView.addSubview(dateView)
    dateView.addSubview(dateLabel)
    contentView.addSubview(dayTimeLabel)
    contentView.addSubview(addressLabel)
    contentView.addSubview(bottomView)

    NSLayoutConstraint.activate([
      dateView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      dateView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
      dateView.heightAnchor.constraint(equalToConstant: 37),
      dateView.widthAnchor.constraint(equalToConstant: 37),

      dateLabel.centerYAnchor.constraint(equalTo: dateView.centerYAnchor),
      dateLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),

      dayTimeLabel.topAnchor.constraint(equalTo: dateView.topAnchor),
      dayTimeLabel.leadingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: 15),
      dayTimeLabel.heightAnchor.constraint(equalToConstant: 15),

      addressLabel.topAnchor.constraint(equalTo: dayTimeLabel.bottomAnchor, constant: 7),
      addressLabel.leadingAnchor.constraint(equalTo: dateView.trailingAnchor, constant: 15),
      addressLabel.heightAnchor.constraint(equalToConstant: 15),

      bottomView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      bottomView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      bottomView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      bottomView.heightAnchor.constraint(equalToConstant: 1)
    ])
  }
}
