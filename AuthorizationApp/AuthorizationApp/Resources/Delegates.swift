//
//  Delegates.swift
//  AuthorizationApp
//
//  Created by Abdurahim on 06.06.2022.
//

import Foundation

protocol SignInDelegate: class {
    func signUpButtonTapped()
    func forgotPasswordButtonTapped()
}

protocol SignUpDelegate: class {
    func signInButtonTapped()
}

protocol ForgotPasswordDelegate: class {
    func signInButtonTapped()
}
