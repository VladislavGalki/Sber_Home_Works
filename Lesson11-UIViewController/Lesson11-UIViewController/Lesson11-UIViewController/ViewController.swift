//
//  ViewController.swift
//  Lesson11-UIViewController
//
//  Created by Владислав Галкин on 18.05.2021.
//

import UIKit

class ViewController: UIViewController, MyActivityProtocol {
    
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let share = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(showActivity))
        navigationItem.title = "Main VC"
        navigationItem.rightBarButtonItem = share
        view.addSubview(label)
    }
    
    @objc func showActivity() {
        let myActivity = MyActivity(title: "AVC", image: UIImage(systemName: "clock"))
        myActivity.delegate = self
        let activityView = UIActivityViewController(activityItems: ["Hello activity"], applicationActivities: [myActivity])
        activityView.excludedActivityTypes = [.postToFlickr, .postToVimeo, .saveToCameraRoll]
        present(activityView, animated: true, completion: nil)
    }
    
    func doSmth() {
        label.isHidden = false
        label.text = "Вы тапнули по активити!"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        label.frame = .init(x: 0, y: 0, width: 200, height: 100)
        label.center = view.center
    }
}

