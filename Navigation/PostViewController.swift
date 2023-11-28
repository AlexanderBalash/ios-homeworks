
import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        title = "Мой пост"
        self.navigationItem.title = title
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonPressed))
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let infoViewController = InfoViewController()
        infoViewController.modalTransitionStyle = .flipHorizontal // flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet // pageSheet
        
        present(infoViewController, animated: true)
    }
}
