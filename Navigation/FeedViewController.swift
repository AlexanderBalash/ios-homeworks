import UIKit

class FeedViewController: UIViewController {
    var post: Post = {
        var post = Post(title: "Мой пост")
        return post
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    private func setupButton() {
        self.view.addSubview(self.button)
        NSLayoutConstraint.activate([self.button.bottomAnchor.constraint(equalTo:self.view.bottomAnchor,constant: -100),
                                     self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     self.button.heightAnchor.constraint(equalToConstant: 50)])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            print("Error!")
        }
    }
    
    @objc  func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
