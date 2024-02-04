
import UIKit
import SwiftUI

class ProfileViewController: UITableViewController {
    
    let data = PostFeed.make()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addSubView()
        setupConstraint()
        
        tableView.rowHeight = 200
        
        self.tableView.tableHeaderView = ProfileView.init(title: "")
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Профиль"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    
    private func setupConstraint() {
        let safeAreaGuide = view.safeAreaLayoutGuide
                
                NSLayoutConstraint.activate([
                    
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
                    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
                    tableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
                    
        ])
    }
    private func addSubView() {
        view.addSubview(tableView)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       
       return "Лента новостей"
    }
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let post = data[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = post.author
        content.secondaryText = post.description
        content.image = UIImage(named: post.image)
        content.imageProperties.cornerRadius = 150
        
        cell.contentConfiguration = content
        

        return cell
    }
}
   
   
