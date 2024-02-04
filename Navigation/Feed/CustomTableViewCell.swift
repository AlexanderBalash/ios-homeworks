//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Alexander Balash on 3.02.24.
//

import Foundation
import UIKit

class CustomTableViewCell:  UITableViewCell {
    
    private var authorPosts: UILabel {
        let authorPosts = UILabel()
        
        return authorPosts
    }
    
    private var descriptionPosts: UILabel {
        let descriptionPosts = UILabel()
        
        return descriptionPosts
    }
    
    private var imagePosts: UIView {
        let imagePosts = UIView()
        
        return imagePosts
    }
    
    private var likesPosts: UILabel {
        let likesPosts = UILabel()
        
        return likesPosts
    }
    
    private var viewsPosts: UILabel {
        let viewsPosts = UILabel()
        
        return viewsPosts
    }
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        addSubview(authorPosts)
        addSubview(descriptionPosts)
        addSubview(imagePosts)
        addSubview(likesPosts)
        addSubview(viewsPosts)
        setupConstraint()
    }
    
   
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    private func setupConstraint() {
        _ = safeAreaLayoutGuide
            
                NSLayoutConstraint.activate([
                    authorPosts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                    authorPosts.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                    
                    imagePosts.topAnchor.constraint(equalTo: authorPosts.topAnchor, constant: 10),
                    imagePosts.centerXAnchor.constraint(equalTo: centerXAnchor),
                    imagePosts.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    descriptionPosts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                    descriptionPosts.topAnchor.constraint(equalTo: imagePosts.topAnchor, constant: 10),
                    
                    likesPosts.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                    likesPosts.topAnchor.constraint(equalTo: descriptionPosts.topAnchor, constant: 10),
                    likesPosts.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
                    
                    viewsPosts.topAnchor.constraint(equalTo: descriptionPosts.topAnchor, constant: 10),
                    viewsPosts.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
                    viewsPosts.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
                    
                    
                    
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard let view = selectedBackgroundView else {
            return
        }
        
        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    func update(_ model: PostFeed) {
        textLabel?.text = model.author
        detailTextLabel?.text = model.description
        
    }
    
}
