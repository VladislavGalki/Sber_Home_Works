//
//  FirstSwiftLibrary.swift
//  FirstSwiftLibrary
//
//  Created by Владислав Галкин on 14.07.2021.
//

import Foundation
import SecondSwiftLibrary
import ObjLibrary


@objc open class FirstSwiftLibrary: NSObject {
    public let firstSwiftLibraryText = "First swift library"
    
    @objc public func firstSwiftLibraryFunc() -> String {
        return firstSwiftLibraryText
    }
    
    public func callSecondSwiftLibrary() -> String {
        let secondSwiftLibrary = SecondSwiftLibrary()
        return secondSwiftLibrary.secondSwiftLibraryText
    }
    
    public func callFirstObjLibrary() -> String {
        let firstObjLibrary = FirstObjLibrary()
        return firstObjLibrary.firstObjLibraryFunc()
    }
}
