//
//  ProfileView.swift
//  Navigation
//
//  Created by Alexander Balash on 29.01.24.
//

import Foundation
import UIKit

class ProfileView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.shadowOffset.width = 4
        imageView.layer.shadowOffset.height = 4
        imageView.layer.shadowRadius = 4
        imageView.layer.shadowOpacity = 0.7
        
        return imageView
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusProfile = UITextField()
        statusProfile.translatesAutoresizingMaskIntoConstraints = false
        statusProfile.backgroundColor = .white
        statusProfile.textColor = .black
        statusProfile.font = UIFont.boldSystemFont(ofSize: 15)
        statusProfile.layer.borderWidth = 1
        statusProfile.layer.borderColor = UIColor.black.cgColor
        statusProfile.layer.cornerRadius = 12
        statusProfile.placeholder = " Enter your status.."
        
        return statusProfile
    }()
    
    internal lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    private lazy var fullNameLabel: UILabel = {
        var nameProfile = UILabel()
        nameProfile.text = "Alexander Balash"
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        nameProfile.font = UIFont.boldSystemFont(ofSize: 20)
        nameProfile.textColor = .black
        
        return nameProfile
    }()
    
    
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.textColor = .black
        status.text = "My status:"
        status.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        return status
    }()
    
    convenience init(title: String) {
        self.init(frame: .zero)
        addSubView()
        setupConstraint()
    }
    
    private func addSubView() {
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
    }
    
    private func setupConstraint() {
        _ = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            fullNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            
            statusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -90),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 40),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            
            setStatusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 170),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20)
        ])
    }
    
    @objc private func buttonPressed() {
        statusTextField.text = statusTextField.text
    }
}
