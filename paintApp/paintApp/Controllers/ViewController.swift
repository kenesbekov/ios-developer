//
//  ViewController.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

enum toolType: String, CaseIterable {
    case brush, rect, triangle, circle
}

class ViewController: UIViewController {
    var currentToolType: toolType = .brush
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var currentToolName: UILabel!
    
    @IBAction func didTapChangeToolButton(type: UIButton) {
        currentToolType = currentToolType.next()
        currentToolName.text = currentToolType.rawValue
    }
    
    @IBAction func didTapToStarButton(type: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StarViewController")
        present(controller, animated: true)
    }

    @IBAction func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        switch currentToolType {
        case .brush:
            guard let v = sender.view else { return }
    
            switch sender.state {
            case .began, .changed:
                let delta = sender.translation(in: v)
    
                let path = UIBezierPath()
                path.move(to: CGPoint(x: delta.x, y: delta.y))
                path.addLine(to: CGPoint(x: delta.x, y: delta.y))
                
                //design path in layer
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = path.cgPath
                shapeLayer.lineWidth = 1.0
                
                view.layer.addSublayer(shapeLayer)
            default:
                break
            }
        default:
            break
        }
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        print("Tap")
        let touchPoint = sender.location(in: sender.view)
        switch currentToolType {
        case .brush:
            break
        case .rect:
            let DynamicView: UIView
            DynamicView = UIView(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width: 100, height: 100))
            DynamicView.backgroundColor = .green
            DynamicView.layer.borderWidth = 1
            self.view.addSubview(DynamicView)
        case .triangle:
            let DynamicView: UIView
            DynamicView = UIView(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width: 100, height: 100))
            DynamicView.backgroundColor = .green
            DynamicView.layer.borderWidth = 1
            self.view.addSubview(DynamicView)
        case .circle:
            let DynamicView: UIView
            DynamicView = UIView(frame: CGRect(x: touchPoint.x, y: touchPoint.y, width: 100, height: 100))
            DynamicView.backgroundColor = .green
            DynamicView.layer.cornerRadius = 50
            DynamicView.layer.borderWidth = 1
            self.view.addSubview(DynamicView)
        }
        
    }
}

extension CaseIterable where Self: Equatable {
    func next() -> Self {
        let all = Self.allCases
        let idx = all.firstIndex(of: self)!
        let next = all.index(after: idx)
        return all[next == all.endIndex ? all.startIndex : next]
    }
}

