//
//  PaintToolsViewController.swift
//  paintApp
//
//  Created by Abi on 16.05.2022.
//

import UIKit

class PaintToolsViewController: UIViewController {
    var currentToolType: ToolType = .pencil
    
    let colorWell: UIColorWell = {
        let colorWell = UIColorWell()
        colorWell.supportsAlpha = true
        colorWell.selectedColor = .black
        colorWell.title = "Color"
        colorWell.layer.cornerRadius = 100
        return colorWell
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Paint Tool Screen"
        
        view.addSubview(colorWell)
        
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorWell.frame = CGRect(
            x: 50,
            y: 30,
            width: 40,
            height: 50
        )
    }
    
    @IBOutlet weak var currentToolButton: UIButton!
    
    @IBAction func didTapChangeToolButton(_ sender: UIButton) {
        guard let parent = parent as? PaintViewController
        else { return }
        
        currentToolType = currentToolType.next()
        currentToolButton.setImage(UIImage(systemName: currentToolType.rawValue), for: .normal)

        parent.paintCanvasViewController?.paintView.currentToolType = currentToolType
    }

    @IBAction func undoLastShape(_ sender: UIButton) {
        guard let parent = parent as? PaintViewController
        else { return }

        parent.paintCanvasViewController?.paintView.undoLast()
    }

    @IBAction func switchedFillingOption(_ sender: UISwitch) {
        guard let parent = parent as? PaintViewController
        else { return }

        parent.paintCanvasViewController?.paintView.currentFillingOption = sender.isOn
    }
    
    @objc private func colorChanged() {
        guard let parent = parent as? PaintViewController
        else { return }
        
        parent.paintCanvasViewController?.paintView.currentColor = colorWell.selectedColor!
    }

}
