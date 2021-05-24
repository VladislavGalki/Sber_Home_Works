//
//  ViewController.swift
//  Lesson13-Animations
//
//  Created by Владислав Галкин on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var loginLeftAnchor: NSLayoutConstraint!
    var passwordRightAnchor: NSLayoutConstraint!
    
    lazy var backgoundImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "sunny")!)
        return image
    }()
    
    lazy var cloud1Image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloud-3")!)
        return image
    }()
    
    lazy var cloud2Image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloud-2")!)
        return image
    }()
    
    lazy var cloud3Image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloud-4")!)
        return image
    }()
    
    lazy var cloud4Image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cloud-1")!)
        return image
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel(frame: .init(x: 0, y: 0, width: 175, height: 34))
        label.backgroundColor = .clear
        label.font = label.font.withSize(28)
        label.textColor = .white
        label.text = "Sunset beach login"
        return label
    }()
    
    lazy var loginTextField: UITextField = {
        let login = UITextField()
        login.backgroundColor = .white
        login.layer.cornerRadius = 3
        login.placeholder = "Username"
        return login
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white
        password.layer.cornerRadius = 3
        password.placeholder = "Password"
        return password
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = .cyan
        button.setTitleColor(.brown, for: .normal)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgoundImage)
        view.addSubview(cloud1Image)
        view.addSubview(cloud2Image)
        view.addSubview(cloud3Image)
        view.addSubview(cloud4Image)
        view.addSubview(headerLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        cloud1Image.translatesAutoresizingMaskIntoConstraints = false
        cloud2Image.translatesAutoresizingMaskIntoConstraints = false
        cloud3Image.translatesAutoresizingMaskIntoConstraints = false
        cloud4Image.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginLeftAnchor = loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -view.bounds.width)
        loginLeftAnchor.isActive = true
        passwordRightAnchor = passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: view.bounds.width)
        passwordRightAnchor.isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        cloudAnimate()
        
        headerLabel.layer.removeAllAnimations()
        let headerAnimation = CABasicAnimation(keyPath: "opacity")
        headerAnimation.fromValue = 0
        headerAnimation.toValue = 1
        headerAnimation.duration = 1.5
        headerLabel.layer.add(headerAnimation, forKey: "headerOpacity")
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
            self?.loginLeftAnchor.isActive = false
            self?.loginTextField.centerXAnchor.constraint(equalTo: (self?.view.centerXAnchor)!).isActive = true
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseInOut], animations: { [weak self] in
            self?.passwordRightAnchor.isActive = false
            self?.passwordTextField.centerXAnchor.constraint(equalTo: (self?.view.centerXAnchor)!).isActive = true
            self?.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backgoundImage.frame = .init(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        setUpUIConstraint()
    }
    
    private func setUpUIConstraint() {
        NSLayoutConstraint.activate([
            cloud1Image.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            cloud1Image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -56),
            cloud1Image.widthAnchor.constraint(equalToConstant: 75),
            cloud1Image.heightAnchor.constraint(equalToConstant: 35),
            
            cloud2Image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 2),
            cloud2Image.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 12),
            cloud2Image.widthAnchor.constraint(equalToConstant: 160),
            cloud2Image.heightAnchor.constraint(equalToConstant: 50),
            
            cloud3Image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            cloud3Image.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50),
            cloud3Image.widthAnchor.constraint(equalToConstant: 115),
            cloud3Image.heightAnchor.constraint(equalToConstant: 50),
            
            cloud4Image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -131),
            cloud4Image.bottomAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: -3),
            cloud4Image.widthAnchor.constraint(equalToConstant: 159),
            cloud4Image.heightAnchor.constraint(equalToConstant: 50),
            
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            
            loginTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 25),
            loginTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.widthAnchor.constraint(equalToConstant: 230),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func cloudAnimate() {
        let optionsAnimate: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]
        
        UIView.animate(withDuration: 2.4, delay: 0, options: optionsAnimate, animations: { [weak self] in
            self?.cloud4Image.frame.size.height *= 1.22
            self?.cloud4Image.frame.size.width *= 1.22
        }, completion: nil)
        
        UIView.animate(withDuration: 2.8, delay: 0.2, options: optionsAnimate, animations: { [weak self] in
            self?.cloud2Image.frame.size.height *= 1.28
            self?.cloud2Image.frame.size.width *= 1.28
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0.1, options: optionsAnimate, animations: { [weak self] in
            self?.cloud1Image.frame.size.height *= 1.15
            self?.cloud1Image.frame.size.width *= 1.15
        }, completion: nil)
        
        UIView.animate(withDuration: 2.9, delay: 0.5, options: optionsAnimate, animations: { [weak self] in
            self?.cloud3Image.frame.size.height *= 1.23
            self?.cloud3Image.frame.size.width *= 1.23
        }, completion: nil)
    }
}

