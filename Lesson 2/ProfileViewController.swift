//
//  ProfileViewController.swift
//  Lesson 2
//
//  Created by Karina Kovaleva on 15.12.22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var profile: Info
    
    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.height / 2, height: self.view.frame.size.height / 2))
        imageView.backgroundColor = .systemGray
        return imageView
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
    
    private var titleLabel: UILabel = {
        var titleLabel = UILabel()
        titleLabel.textColor = .darkGray
        return titleLabel
    }()
    
    private var descriptionLabel: UILabel = {
        var descriptionLabel = UILabel()
        descriptionLabel.textColor = .lightGray
        return descriptionLabel
    }()
    
    init(profile: Info) {
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        setupUI()
        setup()
    }
    
    func setupUI() {
        self.view.addSubview(profileImageView)
        self.view.addSubview(stackViewForLabels)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        stackViewForLabels.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackViewForLabels.topAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            stackViewForLabels.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            stackViewForLabels.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10)
        ])
    }
    
    func setup() {
        guard let image = profile.imageName else { return }
        profileImageView.image = UIImage(named: "\(image)")
        titleLabel.text = profile.title
        descriptionLabel.text = profile.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
