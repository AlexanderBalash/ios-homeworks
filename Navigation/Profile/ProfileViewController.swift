
import UIKit
import SwiftUI

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
    @State private var posts = PostFeed.make()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.shadowOffset.width = 4
        imageView.layer.shadowOffset.height = 4
        imageView.layer.shadowRadius = 4
        imageView.layer.shadowOpacity = 0.7
        
        return imageView
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusProfile = UITextField()
        statusProfile.translatesAutoresizingMaskIntoConstraints = false
        statusProfile.backgroundColor = .white
        statusProfile.textColor = .black
        statusProfile.font = UIFont.boldSystemFont(ofSize: 15)
        statusProfile.text = "Life is good!"
        statusProfile.layer.borderWidth = 1
        statusProfile.layer.borderColor = UIColor.black.cgColor
        statusProfile.layer.cornerRadius = 12
        
        return statusProfile
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.setTitle("Set status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    private lazy var fullNameLabel: UILabel = {
        var nameProfile = UILabel()
        nameProfile.text = "Alexander Balash"
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        nameProfile.font = UIFont.boldSystemFont(ofSize: 20)
        nameProfile.textColor = .black
        
        return nameProfile
    }()
    
    
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.textColor = .black
        status.text = "My status:"
        status.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        return status
    }()
    
    private var tableView: UITableView {
        let tableView  = UITableView.init(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        
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
        navigationItem.title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    private func addSubView() {
        view.addSubview(avatarImageView)
        view.addSubview(setStatusButton)
        view.addSubview(fullNameLabel)
        view.addSubview(statusLabel)
        view.addSubview(statusTextField)
        view.addSubview(tableView)
    }
    
    private func setupConstraint() {
        _ = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            avatarImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            fullNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 88),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            fullNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            
            statusLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            statusLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 50),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 160),
            
            setStatusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 200),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    private func tuneTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        
        _ = TableHeaderView(title: "Лента новостей")
        tableView.tableFooterView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(
            BaseTableViewCell.self,
            forCellReuseIdentifier: CellReuseID.base.rawValue)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func buttonPressed() {
        print(statusTextField.text ?? "My post")
    }
}
    
extension ViewController: UITableViewDataSource {
    
    
    func numberOfRowsInSection(in tableView: UITableView) -> Int { 1 }
    
    func tableView ( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 4 }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {return UITableViewCell.init(style: .default, reuseIdentifier: "Hello world!") }
    
}

extension ViewController: UITableViewDelegate {}
    

    
        


