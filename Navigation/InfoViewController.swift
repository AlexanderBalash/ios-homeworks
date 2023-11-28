import UIKit

class InfoViewController: UIViewController {
    
    @objc private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    private func setupButton() {
        self.view.addSubview(self.actionButton)
        NSLayoutConstraint.activate([self.actionButton.bottomAnchor.constraint(equalTo:self.view.bottomAnchor,constant: -100),
                                     self.actionButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     self.actionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     self.actionButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView()
        textView.text = "Добавление нового поста"
        view.backgroundColor = .systemCyan
        setupButton()
    }
    
    @objc  func buttonAction2() {
        let alert = UIAlertController(title: "Внимание!", message: "Добавить новый пост нет возможности", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Выход", comment: "Default action"), style: .default))
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
}
