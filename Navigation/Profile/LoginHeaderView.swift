
import Foundation
import UIKit

class LoginHeaderView: UIView {
    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private var tableView: UITableView {
        let tableView = UITableView.init(
            frame: .zero,
            style: .insetGrouped)
        
        return tableView
    }
    
    init() {
        super.init(frame: LoginHeaderView.accessibilityFrame())
        backgroundColor = .white
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraint() {
        self.addSubview(logoView)
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            self.logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.logoView.topAnchor.constraint(equalTo: topAnchor, constant: 120)])
    }
}


