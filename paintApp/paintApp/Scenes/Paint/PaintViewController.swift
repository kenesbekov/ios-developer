//
//  PaintViewController.swift
//  paintApp
//
//  Created by Abi on 16.05.2022.
//

import UIKit

enum SegueType: String {
    case paint = "toPaintArea"
    case tools = "toToolsArea"
}

class PaintViewController: UIViewController {
    
    @IBOutlet weak var separatorViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView: UIView!
    
    public weak var paintCanvasViewController: PaintCanvasViewController?
    public weak var paintToolsViewController: PaintToolsViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueType = SegueType(rawValue: segue.identifier ?? "") else { return }
        
        switch segueType {
        case .paint:
            guard let controller = segue.destination as? PaintCanvasViewController else { return }
            
            paintCanvasViewController = controller
        case .tools:
            guard let controller = segue.destination as? PaintToolsViewController else { return }
            
            paintToolsViewController = controller
        }
    }
    
    var startingConstant: CGFloat  = 0.0
    
    @IBAction func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            startingConstant = separatorViewBottomConstraint.constant
        case .changed:
            let translation = sender.translation(in: self.view)
            separatorViewBottomConstraint.constant = startingConstant - translation.y
        default:
            break
        }
    }
}
