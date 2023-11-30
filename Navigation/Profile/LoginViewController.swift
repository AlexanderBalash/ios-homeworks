
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = LoginHeaderView()
        let view = LoginHeaderView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
}
    extension ViewController: UITableViewDataSource {
        func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            2
        }

    @objc func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    }


