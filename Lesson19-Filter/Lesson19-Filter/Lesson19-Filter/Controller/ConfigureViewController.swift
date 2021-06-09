//
//  ConfigureViewController.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 09.06.2021.
//

import UIKit

class ConfigureViewController: UIViewController {

    private let indicator = IndicatorViewController()

    var isLoading = false {
        didSet {
            guard oldValue != isLoading else { return }
            showSpinner(isShown: isLoading)
        }
    }

    private func showSpinner(isShown: Bool) {
        if isShown {
            addChild(indicator)
            indicator.view.frame = view.frame
            view.addSubview(indicator.view)
            indicator.didMove(toParent: self)
        } else {
            indicator.willMove(toParent: nil)
            indicator.view.removeFromSuperview()
            indicator.removeFromParent()
        }
    }
}
