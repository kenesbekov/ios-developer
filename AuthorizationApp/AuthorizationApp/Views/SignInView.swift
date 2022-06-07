//
//  SignInView.swift
//  AuthorizationApp
//
//  Created by Abdurahim on 06.06.2022.
//

import UIKit

class SignInView: UIView {
    public weak var delegate: SignInDelegate?
    
    public var loginField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.3
        textField.font = AppFonts.textFieldFont
        textField.placeholder = "Login"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    public var passwordField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 0.3
        textField.font = AppFonts.textFieldFont
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = AppButtons.signInButtonCornerRadius
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = AppFonts.textFieldFont
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Don't have an account? Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.titleLabel?.font = AppFonts.textFieldFont
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Forgot password", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.titleLabel?.font = AppFonts.textFieldFont
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var signInWithAppleButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = AppButtons.signInButtonCornerRadius
        button.setTitle("Continue with Apple", for: .normal)
        button.titleLabel?.font = AppFonts.textFieldFont
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInWithFacebookButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = AppButtons.signInButtonCornerRadius
        button.setTitle("Continue with Facebook", for: .normal)
        button.titleLabel?.font = AppFonts.textFieldFont
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInWithGoogleButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = AppButtons.signInButtonCornerRadius
        button.setTitle("Continue with Google", for: .normal)
        button.titleLabel?.font = AppFonts.textFieldFont
        button.backgroundColor = .systemRed
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(loginField)
        self.addSubview(passwordField)
        
        self.addSubview(loginButton)
        
        self.addSubview(signUpButton)
        self.addSubview(forgotPasswordButton)
        
        self.addSubview(signInWithAppleButton)
        self.addSubview(signInWithFacebookButton)
        self.addSubview(signInWithGoogleButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate ([
            loginField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            loginField.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            
            passwordField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            loginButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight),
            
            signUpButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor),
            
            forgotPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            forgotPasswordButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor),
            
            signInWithAppleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signInWithAppleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signInWithAppleButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            signInWithAppleButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight),
            
            signInWithFacebookButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signInWithFacebookButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signInWithFacebookButton.topAnchor.constraint(equalTo: signInWithAppleButton.bottomAnchor, constant: 10),
            signInWithFacebookButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight),
            
            signInWithGoogleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signInWithGoogleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signInWithGoogleButton.topAnchor.constraint(equalTo: signInWithFacebookButton.bottomAnchor, constant: 10),
            signInWithGoogleButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight)
        ])
    }
    
    public func animateViews () {
        NSLayoutConstraint.activate([
            signInWithGoogleButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signInWithGoogleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signInWithGoogleButton.topAnchor.constraint(equalTo: signInWithFacebookButton.bottomAnchor, constant: 30),
            signInWithGoogleButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight)
        ])
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func signUpButtonTapped(_ sender: UIButton!) {
        delegate?.signUpButtonTapped()
    }
    
    @objc private func forgotPasswordButtonTapped(_ sender: UIButton!) {
        delegate?.forgotPasswordButtonTapped()
    }
}
