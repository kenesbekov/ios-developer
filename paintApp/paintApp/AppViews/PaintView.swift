//
//  PaintView.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class PaintView: UIView {
    
    var currentToolType: ToolType = .pencil
    private var shapes: [UIBezierPath] = []
    private var initialPoint: CGPoint?
    
    override func draw(_ rect: CGRect) {
        for shape in shapes {
            UIColor.black.set()
            shape.lineWidth = 2
            shape.fill()
            shape.stroke()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initialPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard
            let endPoint = touches.first?.location(in: self),
            let initialPoint = initialPoint
        else { return }
        
        if currentToolType == .pencil {
            shapes.append(drawWithPencil(initialPoint, endPoint))
            self.initialPoint = endPoint
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard
            let endPoint = touches.first?.location(in: self),
            let initialPoint = initialPoint
        else { return }
        
        switch currentToolType {
        case .circlefill:
            shapes.append(drawCircle(initialPoint, endPoint))
        case .rectanglefill:
            shapes.append(drawRectangle(initialPoint, endPoint))
        case .trianglefill:
            shapes.append(drawTriangle(initialPoint, endPoint))
        case .pencil:
            break
        }
        
        setNeedsDisplay()
    }
    
    private func drawWithPencil(_ firstPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let line = UIBezierPath()
        
        line.move(to: firstPoint)
        line.addLine(to: endPoint)
        
        return line
    }
    
    private func drawCircle(_ firstPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let circleCenter = CGPoint(
            x: (firstPoint.x + endPoint.x) / 2,
            y: (firstPoint.y + endPoint.y) / 2
        )
        
        let xChange = endPoint.x - firstPoint.x
        let yChange = endPoint.y - firstPoint.y
        
        let circleRadius: CGFloat = sqrt(xChange * xChange + yChange * yChange) / 2
        
        let circle = UIBezierPath(
            arcCenter: circleCenter,
            radius: circleRadius,
            startAngle: 0.0,
            endAngle: CGFloat(2 * Double.pi),
            clockwise: false
        )
        
        return circle
    }
    
    private func drawRectangle(_ firstPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let rect = CGRect(
            x: firstPoint.x,
            y: firstPoint.y,
            width: endPoint.x - firstPoint.x,
            height: endPoint.y - firstPoint.y
        )
        
        return UIBezierPath(rect: rect)
    }
    
    private func drawTriangle(_ firstPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let triangle = UIBezierPath()
        
        triangle.move(to: CGPoint(x: firstPoint.x, y: firstPoint.y))
        triangle.addLine(to: CGPoint(x: firstPoint.x, y: endPoint.y))
        triangle.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))

        return triangle
    }
}
