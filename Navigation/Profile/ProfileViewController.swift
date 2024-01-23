
import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    fileprivate let data = PostFeed.make()
    
    private var tableView: UITableView {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }
    private enum CellReuseID: String {
        case base = "BaseTableVieCell_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubView()
        setupConstraint()
        tuneTableView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "TableView example"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    private func setupConstraint() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
        ])
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        let headerView = TableHeaderView(title: "Лента новостей")
        tableView.tableFooterView = UIView()
        
        tableView.register(
            BaseTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}
    
extension ViewController: UITableViewDataSource {
    
        
    func numberOfRowsInSection(in tableView: UITableView) -> Int { 1 }
        
    func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 4 }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {return UITableViewCell.init(style: .default, reuseIdentifier: "Hello world!") }
        
    }

extension ViewController: UITableViewDelegate {}
    

    
        


