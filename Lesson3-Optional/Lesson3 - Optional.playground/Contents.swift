import Foundation

class SomeClass<T> {
    
    var value: T
    
    init( someValue: T) {
        value = someValue
    }
}

struct SomeStruct<T> {
    
    var someClass: SomeClass<T>
    var nameStruct: String
    
    init(anyClass: T, name: String) {
        someClass = SomeClass(someValue: anyClass)
        nameStruct = name
    }
    
    var value: T {
        get {
            return someClass.value
        }
        set {
            if (!isKnownUniquelyReferenced(&someClass)) {
                someClass = SomeClass(someValue: newValue)
                return
            }
            someClass.value = newValue
        }
    }
}


