//
//  ViewController.swift
//  AuthorizationApp
//
//  Created by Abdurahim on 05.06.2022.
//

import UIKit

class ViewController: UIViewController {
    private var activeTextField : UITextField? = nil
    
    private var currentViewType: ViewType = .signInView
    
    private lazy var signInView = SignInView()
    private lazy var signUpView =  SignUpView()
    private lazy var forgotPswView = ForgotPasswordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
     
       NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // add delegate to all textfields to self (this view controller)
        signInView.loginField.delegate = self
        signInView.passwordField.delegate = self
        
        signUpView.loginField.delegate = self
        signUpView.passwordField.delegate = self
        signUpView.nameField.delegate = self
        
        forgotPswView.loginField.delegate = self
        
        // choosing sign in option
        signInView.delegate = self
        signUpView.delegate = self
        forgotPswView.delegate = self
        
        setup()
    }
    
    private func setup() {
        setupViews()
        setupContraints()
        
        changeView()
    }
    
    private func setupViews() {
        [signInView, signUpView, forgotPswView].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
    }
    
    private func setupContraints() {
        [signInView, signUpView, forgotPswView].forEach { subView in
            NSLayoutConstraint.activate([
                subView.topAnchor.constraint(equalTo: view.topAnchor),
                subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                subView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    
    private func changeView() {
        self.view.endEditing(true)
        switch currentViewType {
        case .signInView:
            signInView.isHidden = false
            signUpView.isHidden = true
            forgotPswView.isHidden = true
        case .signUpView:
            signInView.isHidden = true
            signUpView.isHidden = false
            forgotPswView.isHidden = true
            
        case .forgotPswView:
            signInView.isHidden = true
            signUpView.isHidden = true
            forgotPswView.isHidden = false
        }
    }
}

extension ViewController: SignInDelegate {
    func signUpButtonTapped() {
        currentViewType = .signUpView
        changeView()
    }
    
    func forgotPasswordButtonTapped() {
        currentViewType = .forgotPswView
        changeView()
    }
}

extension ViewController: SignUpDelegate {
    func signInButtonTapped() {
        currentViewType = .signInView
        changeView()
    }
}

extension ViewController : UITextFieldDelegate {
    // when user select a textfield, this method will be called
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // set the activeTextField to the selected textfield
        self.activeTextField = textField
    }
    
    // when user click 'done' or dismiss the keyboard
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}

extension ViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
          // if keyboard size is not available for some reason, dont do anything
          return
        }

        var shouldMoveViewUp = false

        // if active text field is not nil
        if let activeTextField = activeTextField {
            
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
        
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
                shouldMoveViewUp = true
            }
        }
        if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // move back the root view origin to zero
        self.view.frame.origin.y = 0
    }
}

