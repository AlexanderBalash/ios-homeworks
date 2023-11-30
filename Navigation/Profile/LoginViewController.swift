
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    let loginViewController = LoginHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginHeaderView()
        let view = LoginHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
 
    }
}
