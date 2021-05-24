//
//  SecondVC.swift
//  tv
//
//  Created by Владислав Галкин on 25.05.2021.
//

import UIKit

class SecondVC: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel(frame: .init(x: 0, y: 0, width: 200, height: 50))
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}


