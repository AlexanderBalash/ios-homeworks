

import UIKit

class LoginViewController: UIViewController {
    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var userNameTextField: UITextField = {
        let userName = UITextField()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = .systemGray6
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 16)
        userName.autocapitalizationType = .none
        userName.textColor = .systemGray3
        userName.text = "Email or phone"
        userName.tintColor = .color
        userName.layer.borderWidth = 0.5
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.cornerRadius = 10
        userName.resignFirstResponder()
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        
        return userName
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = UIFont.boldSystemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.textColor = .systemGray3
        password.text = "Password"
        password.tintColor = .color
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10
        password.resignFirstResponder()
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        
        return password
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraint()
        
        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            print("Error!")
        }
    }
    
    func setupConstraint() {
        view.addSubview(logoView)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            self.logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.logoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            
            self.userNameTextField.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 220),
            self.userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            self.userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.userNameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            
            self.passwordTextField.topAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            
            self.button.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 66),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        ])
    }
    
    @objc func buttonPressed() {
        if userNameTextField.text == "Email or phone" {
            let alert = UIAlertController(title: "Attention!", message: "No Email or number!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
            
        } else if passwordTextField.text == "Password" {
            let alert = UIAlertController(title: "Attention!", message: "No password!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            let profileViewController = ProfileViewController()
            profileViewController.view.backgroundColor = .systemBackground
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
}




