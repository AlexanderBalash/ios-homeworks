//
//  PosyTableViewCell.swift
//  Navigation
//
//  Created by Alexander Balash on 7.02.24.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorPost: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.backgroundColor = .white
        author.textColor = .black
        author.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        author.numberOfLines = 2
        author.layer.borderWidth = 1
        author.layer.borderColor = UIColor.black.cgColor
        author.layer.cornerRadius = 12
        
        return author
    }()
    
    private lazy var avatarPost: UIImageView = {
        let avatar = UIImageView()
        avatar.contentMode = .scaleAspectFit
        avatar.backgroundColor = .black
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        avatar.layer.borderWidth = 3
        avatar.layer.shadowOffset.width = 4
        avatar.layer.shadowOffset.height = 4
        avatar.layer.shadowRadius = 4
        avatar.layer.shadowOpacity = 0.7
        
        return avatar
    }()
    
    private lazy var descriptionPost: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.backgroundColor = .white
        description.textColor = .black
        description.font = UIFont.boldSystemFont(ofSize: 15)
        description.layer.borderWidth = 1
        description.layer.borderColor = UIColor.black.cgColor
        description.layer.cornerRadius = 12
        
        return description
    }()
    
    private lazy var likesPost: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.backgroundColor = .white
        likes.textColor = .black
        likes.font = UIFont.boldSystemFont(ofSize: 15)
        likes.layer.borderWidth = 1
        likes.layer.borderColor = UIColor.black.cgColor
        likes.layer.cornerRadius = 12
        
        return likes
    }()
    
    private lazy var viewsPost: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        
        views.backgroundColor = .white
        views.textColor = .black
        views.font = UIFont.boldSystemFont(ofSize: 15)
        views.layer.borderWidth = 1
        views.layer.borderColor = UIColor.black.cgColor
        views.layer.cornerRadius = 12
        
        return views
    }()
    
    convenience init(title: String) {
        self.init(frame: .zero)
        addSubView()
        setupConstraint()
    }
    
    private func addSubView() {
        addSubview(authorPost)
        addSubview(descriptionPost)
        addSubview(avatarPost)
        addSubview(likesPost)
        addSubview(viewsPost)
    }
    
    private func setupConstraint() {
        _ = safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            authorPost.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorPost.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            avatarPost.topAnchor.constraint(equalTo: authorPost.topAnchor, constant: 12),
            avatarPost.centerXAnchor.constraint(equalTo: centerXAnchor),
            avatarPost.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            descriptionPost.topAnchor.constraint(equalTo: avatarPost.topAnchor,constant: 16),
            descriptionPost.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionPost.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
            
            likesPost.topAnchor.constraint(equalTo: descriptionPost.topAnchor, constant: 16),
            likesPost.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            likesPost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16),
            
            viewsPost.topAnchor.constraint(equalTo: descriptionPost.topAnchor, constant: 16),
            viewsPost.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
            viewsPost.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16)
        ])
    }
    
    func configPost(data: PostFeed) {
        authorPost.text = data.author
        avatarPost.image = UIImage(named: data.image )
        descriptionPost.text = data.description
        likesPost.text = data.likes
        viewsPost.text = data.views
    }
}
