import Foundation

// MARK: - Реализовать все виды диспатчеризаций

// MARK: - Direct dispatch

final class SomeDirectClass {
    func sayDirect() {
        print("Direct")
    }
}

struct SomeDirectStruct {
    func sayStructDirect() {
        print("DirectStruct")
    }
}

// MARK: - Virtual and Witness table

//Witness table

protocol SomeVirtualWitnesDispatchProtocol {
    func sayWitnesDispath ()
}

struct SomeWitnesStruct: SomeVirtualWitnesDispatchProtocol {
    func sayWitnesDispath() {
        print("WitnesDispath")
    }
}

// Virtual table

class SomeVirtualClass: SomeVirtualWitnesDispatchProtocol {
    func sayWitnesDispath() {
        print("VirtualDispath")
    }
}

// MARK: - Message Dispatch

class SomeMessageClass {
    dynamic func sayMessageDispatch() {
        print("MessageDispatch")
    }
}


