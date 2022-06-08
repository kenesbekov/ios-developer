//
//  todoListTableViewCell.swift
//  TodoListApp
//
//  Created by Abdurahim on 07.06.2022.
//

import UIKit

final class TodoCell: UITableViewCell {
    public weak var delegate: FavoriteButtonDelegate?
    
    private var cellId: Int?
    
    private lazy var todoTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImages.notFavoriteImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupContraints()
    }
    
    private func setupViews() {
        contentView.addSubview(todoTextView)
        contentView.addSubview(favoriteButton)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            todoTextView.topAnchor.constraint(equalTo: self.topAnchor),
            todoTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            todoTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            todoTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            
            favoriteButton.topAnchor.constraint(equalTo: self.topAnchor),
            favoriteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: todoTextView.trailingAnchor, constant: 40)
        ])
    }
    
    @objc private func favoriteButtonTapped(_ sender: UIButton!) {
        delegate?.favoriteButtonTapped(sender, atIndex: cellId!)
    }
    
    public var todo:(Int, (String, Bool))? {
        didSet {
            guard let todoItem = todo else {return}
            
            cellId = todoItem.0
            todoTextView.text = todoItem.1.0
            
            if todoItem.1.1 == true {
                favoriteButton.setImage(AppImages.favoriteImage, for: .normal)
            } else {
                favoriteButton.setImage(AppImages.notFavoriteImage, for: .normal)
            }
        }
    }
}
