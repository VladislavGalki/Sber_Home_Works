//
//  MyActivity.swift
//  Lesson11-UIViewController
//
//  Created by Владислав Галкин on 18.05.2021.
//

import UIKit

protocol MyActivityProtocol: AnyObject {
    func doSmth()
}

class MyActivity: UIActivity {
    
    var title: String
    var image: UIImage?
    weak var delegate: MyActivityProtocol?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.image = image
        super.init()
    }
    
    
    override var activityTitle: String? {
        return title
    }
    
    override var activityImage: UIImage?{
        return image
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType(rawValue: "MyActivity")
    }
    
    override class var activityCategory: UIActivity.Category{
        return .share
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.delegate?.doSmth()
    }
    
    override func perform() {
        activityDidFinish(true)
    }
}
