

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
// Описание  логотипа
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
// Описание кнопки
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Color")
        button.layer.cornerRadius = 10
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
// Описание свойств никнейма
    private lazy var userNameTextField: UITextField = {
        let userName = UITextField()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = .systemGray6
        userName.textColor = .black
        userName.font = UIFont.boldSystemFont(ofSize: 16)
        userName.autocapitalizationType = .none
        userName.placeholder = "Email or phone"
        userName.layer.cornerRadius = 10
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        userName.resignFirstResponder()
        
        return userName
    }()
// Описание свойств полосы между никнемом и паролем
    private  var uiView: UIView {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        uiView.layer.borderColor = UIColor.black.cgColor
        uiView.backgroundColor = .lightGray
        
        return uiView
    }
// Описание поля для пароля
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = UIFont.boldSystemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.placeholder = "Password"
        password.tintColor = .color
        password.isSecureTextEntry = true
        password.layer.cornerRadius = 10
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.resignFirstResponder()
        
        return password
    }()
    
// Описание свойств стека
    private lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.backgroundColor = .systemGray6
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(uiView)
        stackView.addArrangedSubview(passwordTextField)
        view.addSubview(stackView)
        view.addSubview(logoView)
        view.addSubview(button)
        setupConstraint()
        
        if #available(iOS 15.0, *) {
            view.backgroundColor = .systemMint
        } else {
            print("Error!")
        }
    }
    
// Установка constraint
    func setupConstraint() {
        NSLayoutConstraint.activate([
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: self.logoView.topAnchor, constant: 220),
            stackView.heightAnchor.constraint(equalToConstant: 100.5),
            stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 116.5),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        ])
    }
    
    @objc func buttonPressed() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}







