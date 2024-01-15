import UIKit

class ProfileHeaderView: UIView {
    
    
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
    
    private lazy var statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.textColor = .black
        status.text = "My status:"
        status.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        return status
    }()
    
    private lazy var statusTextField: UITextField = {
        let statusProfile = UITextField()
        statusProfile.translatesAutoresizingMaskIntoConstraints = false
        statusProfile.backgroundColor = .white
        statusProfile.textColor = .black
        statusProfile.font = UIFont.boldSystemFont(ofSize: 15)
        statusProfile.placeholder = "Add status"
        statusProfile.text = "   Life is good!"
        statusProfile.layer.borderWidth = 1
        statusProfile.layer.borderColor = UIColor.black.cgColor
        statusProfile.layer.cornerRadius = 12
        
        return statusProfile
    }()
    
    private lazy var fullNameLabel: UILabel = {
        var nameProfile = UILabel()
        nameProfile.text = "Alexander Balash"
        nameProfile.translatesAutoresizingMaskIntoConstraints = false
        nameProfile.font = UIFont.boldSystemFont(ofSize: 20)
        nameProfile.textColor = .black
        
        return nameProfile
    }()
    
    init() {
        super.init(frame: ProfileHeaderView.accessibilityFrame())
        setupConstraint()
        buttonPressed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraint() {
        
        self.addSubview(self.avatarImageView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.statusTextField)
        self.addSubview(self.statusLabel)
        self.addSubview(UITableView(frame: .zero, style: .plain))
        
        NSLayoutConstraint.activate([
            self.avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            
            self.setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.setStatusButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 320),
            self.setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            self.setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            self.fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 88),
            self.fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            self.fullNameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            self.statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 210),
            self.statusTextField.heightAnchor.constraint(equalToConstant: 40),
            self.statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            self.statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 215),
            
            self.statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 160),
            self.statusLabel.heightAnchor.constraint(equalToConstant: 50),
            self.statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -90)])
    }
    
    @objc private func buttonPressed() {
        print(statusTextField.text ?? "My post")
    }
}
