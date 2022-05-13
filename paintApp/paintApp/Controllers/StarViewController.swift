//
//  StarViewController.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class StarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let star = StarView(frame:CGRect(x: 100, y: 200, width: 150, height: 150))
        star.backgroundColor = .white
        self.view.addSubview(star)
    }
}
