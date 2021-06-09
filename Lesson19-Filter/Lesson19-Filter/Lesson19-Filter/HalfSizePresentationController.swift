//
//  PresentationViewController.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 09.06.2021.
//

import UIKit

class HalfSizePresentationController : UIPresentationController {

    override var frameOfPresentedViewInContainerView: CGRect {
            guard let bounds = containerView?.bounds else { return .zero }
            return CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
        }
}
