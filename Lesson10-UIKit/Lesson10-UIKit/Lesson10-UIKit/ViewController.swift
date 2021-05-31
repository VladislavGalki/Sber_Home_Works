//
//  ViewController.swift
//  Lesson10-UIKit
//
//  Created by Владислав Галкин on 17.05.2021.
//

import UIKit

protocol ViewHitRangeDelegate: AnyObject {
    func configureRanges(ranX: ClosedRange<CGFloat>, ranY: ClosedRange<CGFloat>)
}

class ViewController: UIViewController {
    
    var minX: CGFloat = 0.0
    var maxX: CGFloat = 0.0
    var minY: CGFloat = 0.0
    var maxY: CGFloat = 0.0
    
    weak var delegate: ViewHitRangeDelegate?
    
    lazy var circle: Circle = {
        let circle = Circle()
        circle.backgroundColor = .clear
        return circle
    }()
    
    lazy var circleButton: UIButton = {
        let circleButton = UIButton(type: .system)
        circleButton.addTarget(self, action: #selector(hitResponder), for: .touchUpInside)
        return circleButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = circle
        view.backgroundColor = .white
        view.addSubview(circleButton)
        view.addSubview(circle)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        circle.frame = .init(x: 0, y: 0, width: 300, height: 300)
        circle.center = view.center
        circleButton.frame = .init(x: 0, y: 0, width: 90, height: 90)
        circleButton.layer.cornerRadius = circleButton.bounds.width * 0.5
        circleButton.center = view.center
        
        minX = circle.bounds.width / 2 - circleButton.bounds.width / 2
        maxX = circle.bounds.width / 2 + circleButton.bounds.width / 2
        minY = circle.bounds.height / 2 - circleButton.bounds.height / 2
        maxY = circle.bounds.height / 2 + circleButton.bounds.height / 2
        circle.configureRanges(ranX: minX...maxX, ranY: minY...maxY)
    }
    
    @objc func hitResponder() {
        print(minX, maxX, minY, maxY)
    }
}



