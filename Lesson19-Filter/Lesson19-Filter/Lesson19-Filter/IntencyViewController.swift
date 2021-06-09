//
//  intencyViewController.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 09.06.2021.

import UIKit

class IntencyViewController: UIViewController {

    public var intensityValue: ((CGFloat) -> ())?
    
    lazy var slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.setValue(0.5, animated: false)
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(slider)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let sliderConstraint = [
            slider.widthAnchor.constraint(equalToConstant: 200),
            slider.heightAnchor.constraint(equalToConstant: 100),
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        NSLayoutConstraint.activate(sliderConstraint)
    }
    
    @objc func valueChanged() {
        intensityValue?(CGFloat(slider.value))
    }
}


