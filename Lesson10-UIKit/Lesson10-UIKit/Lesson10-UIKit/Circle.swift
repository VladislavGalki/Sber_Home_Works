//
//  Circle.swift
//  Lesson10-UIKit
//
//  Created by Владислав Галкин on 17.05.2021.
//

import UIKit

class Circle: UIView {
    
    convenience init(radius: CGFloat) {
        self.init(frame: .zero)
        layer.cornerRadius = radius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if view === self {
            return nil
        }
        return view
    }
}
