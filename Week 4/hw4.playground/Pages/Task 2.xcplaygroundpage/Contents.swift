//: [Previous](@previous)
// 2. (10) Выведите в консоли тип каждого элемента по индексу

let array: [Any] = ["Tom", "Jerry", 1, 2, 3, 4, 2.4, 6.5, "Garfield", true, false, false, 40.3]

for (index, element) in array.enumerated() {
    print("\(element) имеет тип \(type(of: element)) по индексу \(index)")
}

//: [Next](@next)
