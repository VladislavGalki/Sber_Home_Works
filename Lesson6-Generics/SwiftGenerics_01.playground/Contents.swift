import Foundation

protocol SomeProtocol {
    static func +(_ lhs: Self, _ rhs: Self) -> Self
}

func sumTwoValues<T:SomeProtocol>(_ a: T, _ b: T) -> T {
    return a + b
}

extension Double : SomeProtocol {}
extension Float  : SomeProtocol {}
extension Int    : SomeProtocol {}
extension String : SomeProtocol {}

print(sumTwoValues("abc", "def"))
print(sumTwoValues(33, 22))
print(sumTwoValues(33.66, 22.32))
