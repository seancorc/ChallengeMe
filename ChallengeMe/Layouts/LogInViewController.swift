//
//  LogInViewController.swift
//  
//
//  Created by Sean Corcoran on 12/1/18.
//

import UIKit


class LogInViewController: UIViewController {
    var userNameTextField: UITextField!
    var passwordTextField: UITextField!
    var signInButton: UIButton!
    var challengeMeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        
        challengeMeLabel = UILabel()
        challengeMeLabel.text = "ChallengeMe"
        challengeMeLabel.translatesAutoresizingMaskIntoConstraints = false
        challengeMeLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 36)
        challengeMeLabel.textColor = .white
        challengeMeLabel.textAlignment = .center
        self.view.addSubview(challengeMeLabel)
        
        userNameTextField = UITextField()
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.autocapitalizationType = .none
        userNameTextField.textAlignment = .center
        userNameTextField.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        userNameTextField.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        userNameTextField.layer.cornerRadius = 10
        self.view.addSubview(userNameTextField)
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.textAlignment = .center
        passwordTextField.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        passwordTextField.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        passwordTextField.layer.cornerRadius = 10
        self.view.addSubview(passwordTextField)
        
        signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In!", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        signInButton.layer.cornerRadius = 10
        signInButton.backgroundColor = UIColor.cyan
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        self.view.addSubview(signInButton)
        
        
        
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    

    func setupConstraints() {
        NSLayoutConstraint.activate([
            challengeMeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            challengeMeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            challengeMeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.frame.height / 6),
            challengeMeLabel.heightAnchor.constraint(equalToConstant: 75),
            ])
        
        NSLayoutConstraint.activate([
        userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        userNameTextField.heightAnchor.constraint(equalToConstant: 75),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordTextField.centerYAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 56),
            passwordTextField.heightAnchor.constraint(equalToConstant: 75),
            ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            signInButton.centerYAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 112),
            signInButton.heightAnchor.constraint(equalToConstant: 75),
            ])
        
        
    }
    
    @objc func signInButtonPressed() {
        //Fix force unwrap
        NetworkManager.login(username: userNameTextField.text!, password: passwordTextField.text!) { (user) in
            
        }
        navigationController?.pushViewController(MainTabBarController(), animated: true)
        
        
        
    }
}
