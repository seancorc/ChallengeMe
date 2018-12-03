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
    var originalSignInButton: UIButton!
    var challengeMeLabel: UILabel!
    var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 255/255, green: 84/255, blue: 42/255, alpha: 1)
        
        challengeMeLabel = UILabel()
        challengeMeLabel.text = "ChallengeMe"
        challengeMeLabel.translatesAutoresizingMaskIntoConstraints = false
        challengeMeLabel.font = UIFont(name: "KohinoorTelugu-Regular", size: 36)
        challengeMeLabel.textColor = .white
        challengeMeLabel.textAlignment = .center
        self.view.addSubview(challengeMeLabel)
        
        userNameTextField = UITextField()
        userNameTextField.isHidden = true
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.autocapitalizationType = .none
        userNameTextField.textAlignment = .center
        userNameTextField.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        userNameTextField.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        userNameTextField.layer.cornerRadius = 10
        self.view.addSubview(userNameTextField)
        
        passwordTextField = UITextField()
        passwordTextField.isHidden = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.textAlignment = .center
        passwordTextField.backgroundColor = UIColor.init(red: 54/255, green: 63/255, blue: 69/255, alpha: 0.4)
        passwordTextField.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        passwordTextField.layer.cornerRadius = 10
        self.view.addSubview(passwordTextField)
        
        signInButton = UIButton()
        signInButton.isHidden = true
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 24)
        signInButton.layer.cornerRadius = 10
        signInButton.backgroundColor = UIColor(red: 69/255, green: 233/255, blue: 255/255, alpha: 1)
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        self.view.addSubview(signInButton)
        
        signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 18)
        signUpButton.layer.cornerRadius = 10
        signUpButton.backgroundColor = UIColor(red: 69/255, green: 233/255, blue: 255/255, alpha: 1)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        self.view.addSubview(signUpButton)
        
        originalSignInButton = UIButton()
        originalSignInButton.translatesAutoresizingMaskIntoConstraints = false
        originalSignInButton.setTitle("Sign In", for: .normal)
        originalSignInButton.titleLabel?.font = UIFont(name: "KohinoorTelugu-Regular", size: 18)
        originalSignInButton.layer.cornerRadius = 10
        originalSignInButton.backgroundColor = UIColor(red: 69/255, green: 233/255, blue: 255/255, alpha: 1)
        originalSignInButton.addTarget(self, action: #selector(originalSignInButtonPressed), for: .touchUpInside)
        self.view.addSubview(originalSignInButton)
        
        
        
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
        
        NSLayoutConstraint.activate([
            originalSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 2 + 12),
            originalSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            originalSignInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            originalSignInButton.heightAnchor.constraint(equalToConstant: 75),
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            signUpButton.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 2 - 12),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24),
            signUpButton.heightAnchor.constraint(equalToConstant: 75),
            ])
        
        
    }
    
    @objc func signInButtonPressed() {
        //Fix force unwrap
        if signInButton.titleLabel?.text == "Sign In" {
        NetworkManager.login(username: userNameTextField.text!, password: passwordTextField.text!) { (user) in
            VariablesInstance.user = user
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            
            let tabController = MainTabBarController()
            let snapshot: UIView? = appDelegate?.window?.snapshotView(afterScreenUpdates: true)
            UIApplication.shared.keyWindow?.rootViewController = tabController
            if let snapshot = snapshot {
                tabController.view.addSubview(snapshot)
                UIView.animate(withDuration: 0.5, animations: {
                    snapshot.layer.opacity = 0
                    snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
                }, completion: { (completed) in
                    snapshot.removeFromSuperview()
                })

            }
            
            
            }
            
            
            
    }
        if signInButton.titleLabel?.text == "Sign Up" {
            NetworkManager.signUp(username: userNameTextField.text!, password: passwordTextField.text!) { (user) in
                VariablesInstance.user = user
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                
                let tabController = MainTabBarController()
                let snapshot: UIView? = appDelegate?.window?.snapshotView(afterScreenUpdates: true)
                UIApplication.shared.keyWindow?.rootViewController = tabController
                if let snapshot = snapshot {
                    tabController.view.addSubview(snapshot)
                    UIView.animate(withDuration: 0.5, animations: {
                        snapshot.layer.opacity = 0
                        snapshot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
                    }, completion: { (completed) in
                        snapshot.removeFromSuperview()
                    })
                    
                }
                
            }
        }
    }
    
    
    @objc func signUpButtonPressed() {
            print("pressesed")
            signInButton.setTitle("Sign Up", for: .normal)
            passwordTextField.isHidden = false
            userNameTextField.isHidden = false
            signInButton.isHidden = false
            originalSignInButton.isHidden = false
            signUpButton.isHidden = true
        }
    
    @objc func originalSignInButtonPressed() {
        signInButton.setTitle("Sign In", for: .normal)
        signUpButton.isHidden = false
        passwordTextField.isHidden = false
        userNameTextField.isHidden = false
        signInButton.isHidden = false
        originalSignInButton.isHidden = true
    }
        
        
    }

