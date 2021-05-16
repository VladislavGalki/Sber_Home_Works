//
//  ViewController.swift
//  Lesson10-UIKit
//
//  Created by Владислав Галкин on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var circle: Circle = {
        let circle = Circle(radius: 100)
        circle.backgroundColor = .orange
        return circle
    }()
    
    lazy var whiteCircle: Circle = {
        let whiteCircle = Circle(radius: 50)
        whiteCircle.backgroundColor = self.view.backgroundColor
        return whiteCircle
    }()
    
    lazy var circleButton: UIButton = {
        let circleButton = UIButton(type: .system)
        circleButton.addTarget(self, action: #selector(hitResponder), for: .touchUpInside)
        return circleButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(circle)
        view.addSubview(circleButton)
        view.addSubview(whiteCircle)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        circle.frame = .init(x: 0, y: 0, width: 200, height: 200)
        circle.center = view.center
        whiteCircle.frame = .init(x: 0, y: 0, width: 100, height: 100)
        whiteCircle.center = circle.center
        circleButton.frame = whiteCircle.frame
        circleButton.center = whiteCircle.center
    }
    
    @objc func hitResponder() {
        print("Hit responder")
    }
}



