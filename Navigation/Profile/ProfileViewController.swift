
import UIKit

class ProfileViewController: UIViewController {
    
    let profileViewController = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = ProfileHeaderView()
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint()
    }
    
    private func setupConstraint() {
        self.view.addSubview(self.profileViewController)
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([self.profileViewController.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     self.profileViewController.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
                                     self.profileViewController.heightAnchor.constraint(equalToConstant: 220),
                                     self.profileViewController.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor)])
    }
}
