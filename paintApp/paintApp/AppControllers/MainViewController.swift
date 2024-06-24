//
//  MainViewController.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main Screen"
    }
    
    @IBAction func goToPaintView(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PaintViewController")
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func goToStarView(type: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StarViewController")
        present(controller, animated: true)
    }
}
