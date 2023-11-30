
import Foundation
import UIKit


class LoginHeaderView: UIView {
    
    private lazy var logoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
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
        //tintColor
        userName.text = " Email or phone "
        userName.layer.borderWidth = 0.5
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.cornerRadius = 10
        
        return userName
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = UIFont.boldSystemFont(ofSize: 16)
        password.autocapitalizationType = .none
        //tintColor
        password.text = " Password "
        password.layer.borderWidth = 0.5
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.cornerRadius = 10
        
        return password
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setBackgroundImage( UIImage(named: "blue_pixel"), for: button.state)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 50
        
        return button
    }()
    
    init() {
        super.init(frame: LoginHeaderView.accessibilityFrame())
        backgroundColor = .white
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 

    private func setupConstraint() {
        self.addSubview(logoView)
        self.addSubview(userNameTextField)
        self.addSubview(passwordTextField)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            self.logoView.heightAnchor.constraint(equalToConstant: 100),
            self.logoView.widthAnchor.constraint(equalToConstant: 100),
            self.logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.logoView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            
            self.userNameTextField.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 120),
            self.userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            self.userNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.userNameTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            self.passwordTextField.topAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
        
            self.button.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 66),
            self.button.heightAnchor.constraint(equalToConstant: 50),
            self.button.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            self.button.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 236),
            

            ])
    }
}


