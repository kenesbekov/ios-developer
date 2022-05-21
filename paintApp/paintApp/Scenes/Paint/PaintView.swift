//
//  PaintView.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class PaintView: UIView {
    
    var currentColor: UIColor = .black
    var currentFillingOption: Bool = true
    var currentToolType: ToolType = .pencil
    private var shapes: [(path: [UIBezierPath], color: UIColor, filled: Bool)] = []
    private var shapesLastIndex = -1
    private var initialPoint: CGPoint?
    
    override func draw(_ rect: CGRect) {
        for shape in shapes {
            shape.color.set()
            for path in shape.path {
                path.lineWidth = 2
                if shape.filled {
                    path.fill()
                }
                path.stroke()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        initialPoint = touches.first?.location(in: self)
        
        if currentToolType == .brush {
            shapes.append((path: [], color: backgroundColor!, filled: false))
        } else {
            shapes.append((path: [], color: currentColor, filled: currentFillingOption))
        }
        shapesLastIndex += 1
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard
            let endPoint = touches.first?.location(in: self),
            let initialPoint = initialPoint
        else { return }
        
        drawShape(initialPoint, endPoint)
        setNeedsDisplay()
    }

    public func undoLast() {
        if shapes.isEmpty == false {
            shapes.removeLast()
            shapesLastIndex -= 1
            setNeedsDisplay()
        }
    }
    
    private func drawShape(_ initialPoint: CGPoint, _ endPoint: CGPoint) {
        if currentToolType == .pencil || currentToolType == .brush {
            shapes[shapesLastIndex].path.append(drawShapeType(initialPoint, endPoint))
            self.initialPoint = endPoint
        } else {
            if shapes[shapesLastIndex].path.isEmpty {
                shapes[shapesLastIndex].path.append(drawShapeType(initialPoint, endPoint))
            } else {
                shapes[shapesLastIndex].path[0] = drawShapeType(initialPoint, endPoint)
            }
        }
    }
    
    private func drawShapeType(_ initialPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        switch currentToolType {
        case .rectangle:
            return drawRectangle(initialPoint, endPoint)
        case .triangle:
            return drawTriangle(initialPoint, endPoint)
        case .circle:
            return drawCircle(initialPoint, endPoint)
        case .pencil, .brush:
            return drawWithPencil(initialPoint, endPoint)
        }
    }
    
    private func drawWithPencil(_ initialPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let line = UIBezierPath()
        
        line.move(to: initialPoint)
        line.addLine(to: endPoint)
        
        return line
    }
    
    private func drawCircle(_ initialPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let circleCenter = CGPoint(
            x: (initialPoint.x + endPoint.x) / 2,
            y: (initialPoint.y + endPoint.y) / 2
        )
        
        let xChange = endPoint.x - initialPoint.x
        let yChange = endPoint.y - initialPoint.y
        
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
    
    private func drawRectangle(_ initialPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let rect = CGRect(
            x: initialPoint.x,
            y: initialPoint.y,
            width: endPoint.x - initialPoint.x,
            height: endPoint.y - initialPoint.y
        )
        
        return UIBezierPath(rect: rect)
    }
    
    private func drawTriangle(_ initialPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let triangle = UIBezierPath()
        
        triangle.move(to: CGPoint(x: initialPoint.x, y: initialPoint.y))
        triangle.addLine(to: CGPoint(x: initialPoint.x, y: endPoint.y))
        triangle.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        triangle.addLine(to: CGPoint(x: initialPoint.x, y: initialPoint.y))

        return triangle
    }
}
