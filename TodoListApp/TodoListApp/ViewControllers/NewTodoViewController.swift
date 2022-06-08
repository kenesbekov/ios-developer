//
//  AddTodoViewController.swift
//  TodoListApp
//
//  Created by Abdurahim on 07.06.2022.
//

import UIKit

class NewTodoViewController: UIViewController {
    public let newTodoView = NewTodoView(frame: CGRect(
        x: 0,
        y: 0,
        width: ScreenSize.screenWidth,
        height: ScreenSize.screenHeight)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(newTodoView)
    }
}


