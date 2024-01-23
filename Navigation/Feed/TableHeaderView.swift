//
//  File.swift
//  Navigation
//
//  Created by Alexander Balash on 18.01.24.
//

import Foundation
import UIKit

class TableHeaderView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        
        return label
    }()
    
    convenience init(title: String) {
        self.init(frame: .zero)
        
        titleLabel.text = title
    }
    private func tuneView() {
        backgroundColor = .secondarySystemBackground
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubview() {
        addSubview(titleLabel)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)])
    }
}
