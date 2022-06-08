//
//  NewTodoView.swift
//  TodoListApp
//
//  Created by Abdurahim on 08.06.2022.
//

import UIKit

final class NewTodoView: UIView {
    public weak var delegate: NewTodoViewDelegate?
    
    private lazy var todoTextField: UITextField = {
        let textField = UITextField()
        textField.addTarget(self, action: #selector(todoTextEditChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var newTodoButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setTitle("New To-Do", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(newTodoButtonTapped), for: .touchUpInside)
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
        setupViews()
        setupContraints()
    }
    
    private func setupViews() {
        self.addSubview(todoTextField)
        self.addSubview(newTodoButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            todoTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            todoTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            todoTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            
            newTodoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            newTodoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            newTodoButton.topAnchor.constraint(equalTo: todoTextField.bottomAnchor, constant: 20),
            newTodoButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func todoTextEditChanged(_ sender: UITextField!) {
        if let todoText = sender.text, todoText.isEmpty {
            newTodoButton.backgroundColor = .systemGray
        } else {
            newTodoButton.backgroundColor = .systemGreen
        }
    }
    
    @objc private func newTodoButtonTapped(_ sender: UIButton!) {
        if let todoText = todoTextField.text, todoText.count > 0 {
            delegate?.newTodoButtonTapped(sender, todoText: todoTextField.text!)
        }
    }
}
