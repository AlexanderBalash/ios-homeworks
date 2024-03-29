//
//  BaseViewCell.swift
//  Navigation
//
//  Created by Alexander Balash on 18.01.24.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Lifecycle
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )

        tuneView()
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
    
    // @link https://stackoverflow.com/a/72277752
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        guard let view = selectedBackgroundView else {
            return
        }
        
        contentView.insertSubview(view, at: 0)
        selectedBackgroundView?.isHidden = !selected
    }
    
    // MARK: - Private
    
    private func tuneView() {
        backgroundColor = .tertiarySystemBackground
        contentView.backgroundColor = .tertiarySystemBackground
        textLabel?.backgroundColor = .clear
        detailTextLabel?.backgroundColor = .clear
        imageView?.backgroundColor = .clear

        accessoryView = nil
        accessoryType = .disclosureIndicator
        
        selectionStyle = .gray
        let selectedView = UIView()
        selectedView.backgroundColor = .systemBlue
        selectedBackgroundView = selectedView
    }
    
    // MARK: - Public
    
    func update(_ model: PostFeed) {
        textLabel?.text = model.author
        detailTextLabel?.text = model.description
        
    }
}
