//
//  PaintViewController.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class PaintViewController: UIViewController {
    var currentToolType: ToolType = .pencil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Paint Screen"
    }
        
    @IBOutlet weak var paintView: PaintView!

    @IBOutlet weak var currentToolButton: UIButton!
    
    @IBAction func didTapChangeToolButton(_ sender: UIButton) {
        currentToolType = currentToolType.next()
        currentToolButton.setImage(UIImage(systemName: currentToolType.rawValue), for: .normal)
        
        paintView.currentToolType = currentToolType
    }
}





