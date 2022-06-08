//
//  TodosView.swift
//  TodoListApp
//
//  Created by Abdurahim on 08.06.2022.
//

import UIKit

class TodosView: UIView {
    public weak var delegate: TodoViewDelegate?
    
    private lazy var newTodoButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImages.plusCircle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(TodosView.self, action: #selector(newTodoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["All", "Favorites"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(TodosView.self, action: #selector(segmentedValueChanged), for: .valueChanged)
        return segmentedControl
    }()
    
    public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setup() {
        setupViews()
        setupContraints()
    }
    
    private func setupViews() {
        self.addSubview(tableView)
        self.addSubview(newTodoButton)
        self.addSubview(segmentedControl)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate ([
            newTodoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            newTodoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),

            segmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            segmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            segmentedControl.topAnchor.constraint(equalTo: newTodoButton.bottomAnchor, constant: 20),
            
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @objc private func segmentedValueChanged(_ sender: UISegmentedControl!) {
        delegate?.segmentedValueChanged(sender)
    }
    
    @objc private func newTodoButtonTapped(_ sender: UIButton!) {
        delegate?.newTodoButtonTapped(sender)
    }
}
