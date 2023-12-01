

import UIKit

class LoginViewController: UIViewController {
    
    let loginViweController = LoginHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginHeaderView()
        let view = LoginHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
    }
}
