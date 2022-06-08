//
//  MainViewController.swift
//  TodoListApp
//
//  Created by Abdurahim on 06.06.2022.
//

import UIKit

final class MainViewController: UIViewController {
    private let todosView = TodosView(frame: CGRect(
        x: 0,
        y: 0,
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight)
    )
    
    private var favoritesShowing: Bool = false
    private var todos: [(String, Bool)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        
        setupNavigationController()
        setupTodosView()
    }
    
    private func setupNavigationController() {
        navigationItem.title = "To-Do List"
        navigationController?.navigationBar.largeTitleTextAttributes = AppColors.navigationTitleColor
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTodosView() {
        todosView.translatesAutoresizingMaskIntoConstraints = false
        
        todosView.tableView.register(TodoCell.self, forCellReuseIdentifier: "cell")
        todosView.tableView.delegate = self
        todosView.tableView.dataSource = self
        
        view.addSubview(todosView)
    }
}

extension MainViewController: NewTodoViewDelegate {
    func newTodoButtonTapped(_ sender: UIButton!, todoText: String) {
        todos.append((todoText, false))
        todosView.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

extension MainViewController: TodoViewDelegate {
    func newTodoButtonTapped(_ sender: UIButton!) {
        let newTodoVC = NewTodoViewController()
        newTodoVC.newTodoView.delegate = self
        navigationController?.pushViewController(newTodoVC, animated: true)
    }
    
    func segmentedValueChanged(_ sender: UISegmentedControl!) {
        favoritesShowing = !favoritesShowing
        todosView.tableView.reloadData()
    }
}

extension MainViewController: FavoriteButtonDelegate {
    func favoriteButtonTapped(_ sender: UIButton!, atIndex id: Int) {
        todos[id].1 = !todos[id].1
        todosView.tableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TodoCell
        
        if favoritesShowing == true && todos[indexPath.row].1 == true
        || favoritesShowing == false {
            cell.todo = (indexPath.row, todos[indexPath.row])
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
}

