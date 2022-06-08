//
//  Delegates.swift
//  TodoListApp
//
//  Created by Abdurahim on 07.06.2022.
//

import UIKit

protocol FavoriteButtonDelegate: class {
    func favoriteButtonTapped(_ sender: UIButton!, atIndex id: Int)
}

protocol TodoViewDelegate: class {
    func newTodoButtonTapped(_ sender: UIButton!)
    func segmentedValueChanged(_ sender: UISegmentedControl!)
}

protocol NewTodoViewDelegate: class {
    func newTodoButtonTapped(_ sender: UIButton!, todoText: String)
}
