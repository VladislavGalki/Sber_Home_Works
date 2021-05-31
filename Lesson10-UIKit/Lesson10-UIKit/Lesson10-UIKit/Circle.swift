//
//  Circle.swift
//  Lesson10-UIKit
//
//  Created by Владислав Галкин on 17.05.2021.
//

import UIKit

class Circle: UIView, ViewHitRangeDelegate {
    
    var color: UIColor = .orange
    var ranX: ClosedRange<CGFloat>?
    var ranY: ClosedRange<CGFloat>?
    
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let path = UIBezierPath(arcCenter: center, radius: 90, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        color.setStroke()
        
        path.lineWidth = 90
        path.stroke()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if ranX!.contains(point.x) && ranY!.contains(point.y) {
            return nil
        } else {
            return view
        }
    }
    
    func configureRanges(ranX: ClosedRange<CGFloat>, ranY: ClosedRange<CGFloat>) {
        self.ranX = ranX
        self.ranY = ranY
    }
}
