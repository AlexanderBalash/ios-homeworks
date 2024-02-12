import Foundation
import UIKit

class ProfileViewController: UIViewController  {
    
    fileprivate let data = PostFeed.make()
    static let headerIdent = "header"
    
    private var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return tableView
    }()
    
    private enum CellReuseID: String {
        case custom = "CustomViewCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ProfileView())
        view.addSubview(tableView)
        setupConstraints()
        tuneTableView()
        
        
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(
                at: indexPath,
                animated: animated
            )
        }
    }
    
    
    func setupConstraints() {
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60.0
        tableView.tableFooterView = UIView()
        tableView.register(
                   PostTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.custom.rawValue
        )
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.custom.rawValue, for: indexPath) as? PostTableViewCell else { fatalError("Error") }
    
        cell.configPost(data: data[indexPath.row])
        
        return cell
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tableHeaderView = ProfileView.init(title: "Профиль")
        return tableHeaderView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
    
}

