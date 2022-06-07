//
//  ForgotPasswordView.swift
//  AuthorizationApp
//
//  Created by Abdurahim on 06.06.2022.
//

import UIKit

class ForgotPasswordView: UIView {
    public weak var delegate: SignUpDelegate?
    
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
    
    private lazy var ForgetPasswordButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = AppButtons.signInButtonCornerRadius
        button.setTitle("Forget password", for: .normal)
        button.titleLabel?.font = AppFonts.textFieldFont
        button.backgroundColor = .systemGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Already have an account? Sign In", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.titleLabel?.font = AppFonts.textFieldFont
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
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
        
        self.addSubview(ForgetPasswordButton)
        
        self.addSubview(signInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate ([
            loginField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            loginField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            loginField.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            
            ForgetPasswordButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            ForgetPasswordButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            ForgetPasswordButton.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 20),
            ForgetPasswordButton.heightAnchor.constraint(equalToConstant: AppButtons.signInButtonHeight),
            
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            signInButton.topAnchor.constraint(equalTo: ForgetPasswordButton.bottomAnchor),
        ])
    }
    
    @objc private func signInButtonTapped() {
        delegate?.signInButtonTapped()
    }
}
