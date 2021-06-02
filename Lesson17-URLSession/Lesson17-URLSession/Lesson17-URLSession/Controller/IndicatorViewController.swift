//
//  ActivityViewController.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import UIKit

final class IndicatorViewController: UIViewController {
    private let indicator = UIActivityIndicatorView(style: .large)

    override func loadView() {
        view = UIView()

        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        view.addSubview(indicator)

        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
