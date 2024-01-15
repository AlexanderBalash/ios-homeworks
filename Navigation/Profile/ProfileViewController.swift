
import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct PostFeed {
    //MARK: -  Описание свойств
        var author: String
        var description: String
        var image: String
        var likes: Int
        var views: Int
    }
    //MARK: - Создание массива
    static func make() -> [PostFeed] {
        [
            PostFeed(author: "Nikita Glytay", description: "Если вы давно этого хотели, то начало года — самое время сделать шаг.", image: "NikitaGlytay", likes: 24353, views: 3453534),
            PostFeed(author: "Misha Osipchuk", description: "Люди, которые достаточно сумасшедшие, чтобы думать, что они могут изменить мир — это те, кто действительно на это способен", image: "MishaOsipchuk", likes: 23423, views: 23423453),
            PostFeed(author: "Vlad Ulasovec", description: "Изменения – закон жизни. И те, кто смотрит только в прошлое или только на настоящее, бесспорно, пропустят будущее", image: "VladUlasovec", likes: 324324, views: 234234),
            PostFeed(author: "Alexander Balash", description: "Даже в самой худшей судьбе есть возможности для счастливых перемен.", image: "AlexanderBalash", likes: 242342354, views: 23423423)
        ]
    }
    
    var postTableView = UITableView()
    let identefire = "MyCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTable()
        
        
    }
    private func createTable() {
        self.postTableView = UITableView(frame: .zero, style: .plain)
        postTableView.register(UITableView.self, forCellReuseIdentifier: identefire)
        
        self.postTableView.delegate = self
        self.postTableView.dataSource = self
        
        postTableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        view.addSubview(postTableView)
    }
    //MARK: - UITableViewDataSource
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = postTableView.dequeueReusableCell(withIdentifier: identefire, for: indexPath)
    //MARK: - Завис...
        cell.contentView = PostFeed.init(author: <#T##String#>, description: <#T##String#>, image: <#T##String#>, likes: <#T##Int#>, views: <#T##Int#>)
        return cell
    }
    //MARK: - UITableViewDelegate
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
    
}
