//
//  TableViewCell.swift
//  Lesson 2
//
//  Created by Karina Kovaleva on 13.12.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    var avatar: UIImageView = {
        var avatar = UIImageView()
        avatar.backgroundColor = .systemGray
        return avatar
    }()
    
    private lazy var stackViewForLabels: UIStackView = {
        var stackViewForLabels = UIStackView()
        stackViewForLabels.axis = .vertical
        stackViewForLabels.distribution = .fillProportionally
        stackViewForLabels.alignment = .leading
        stackViewForLabels.spacing = 5
        [self.titleLabel, self.descriptionLabel].forEach { stackViewForLabels.addArrangedSubview($0) }
        return stackViewForLabels
    }()
    
    var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.textColor = .darkGray
        return titleLabel
    }()
    
    var descriptionLabel: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.textColor = .lightGray
        return descriptionLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    private func setupCell() {
        
        self.contentView.addSubview(avatar)
        self.contentView.addSubview(stackViewForLabels)

        avatar.translatesAutoresizingMaskIntoConstraints = false
        stackViewForLabels.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            avatar.trailingAnchor.constraint(equalTo: stackViewForLabels.leadingAnchor, constant: -20),
            avatar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            avatar.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            avatar.widthAnchor.constraint(equalTo: self.contentView.heightAnchor, constant: -20),
            stackViewForLabels.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            stackViewForLabels.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            stackViewForLabels.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            stackViewForLabels.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
