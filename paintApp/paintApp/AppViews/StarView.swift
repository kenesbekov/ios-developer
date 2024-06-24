//
//  StarView.swift
//  paintApp
//
//  Created by Abi on 13.05.2022.
//

import UIKit

class StarView: UIView {
    
    var cornerRadius: CGFloat = 0  { didSet { setNeedsDisplay() } }
    var rotation: CGFloat = 54     { didSet { setNeedsDisplay() } }
    var color = UIColor.yellow     { didSet { setNeedsDisplay() } }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let center = CGPoint(
            x: rect.width  / 2,
            y: rect.height / 2
        )
        let widthWithoutCornerRadius = rect.width / 2 - cornerRadius
        
        for i in 1...5 {
            let newCenter = CGPoint(
                x: center.x + widthWithoutCornerRadius * cos(rotation * .pi / 180),
                y: center.y + widthWithoutCornerRadius * sin(rotation * .pi / 180)
            )

            let move = CGPoint(
                x: newCenter.x + cornerRadius * cos((rotation - 72) * .pi / 180),
                y: newCenter.y + cornerRadius * sin((rotation - 72) * .pi / 180)
            )

            if i == 1 { path.move   (to: move) }
            else      { path.addLine(to: move) }

            path.addArc(
                withCenter: newCenter,
                radius: cornerRadius,
                startAngle: (rotation - 72) * .pi / 180,
                endAngle:   (rotation + 72) * .pi / 180,
                clockwise: true
            )

            rotation += 144
        }
        
        path.close()
        color.setFill()
        path.fill()
    }
}
