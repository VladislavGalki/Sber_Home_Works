//
//  ViewController.swift
//  Lesson31-Swift+ObjC
//
//  Created by Владислав Галкин on 14.07.2021.
//

import UIKit
import FirstObjLibrary
import FirstSwiftLibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstObjLibrary = FirstObjLibrary()
        print(firstObjLibrary.firstObjLibraryFunc())
        print(firstObjLibrary.callSecondIbjLibrary())
        
        let firstSwiftLibrary = FirstSwiftLibrary()
        print(firstSwiftLibrary.firstSwiftLibraryText)
        print(firstSwiftLibrary.callSecondSwiftLibrary())
                
        
        print(firstSwiftLibrary.firstSwiftLibraryText)
        print(firstSwiftLibrary.callFirstObjLibrary())
        
        print(firstObjLibrary.firstObjLibraryFunc())
        print(firstObjLibrary.callFirstSwiftLibrary())
    }
    
}

