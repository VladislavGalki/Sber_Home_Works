import Foundation

 //Задание 3 Самому сделать не получилось, посмотрел реализацию на swiftbook - https://swiftbook.ru/post/koposhilka/linked-lists/ оказалось что очень просто.

 struct LinkedList<T> {
     var head: LinkedListNode<T>?
     init(head: LinkedListNode<T>) {
         self.head = head
     }
 }

 indirect enum LinkedListNode<T> {
     case value(element: T, next: LinkedListNode<T>)
     case end
 }
