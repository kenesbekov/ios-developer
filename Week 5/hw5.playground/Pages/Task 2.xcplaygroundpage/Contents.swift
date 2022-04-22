//: [Previous](@previous)
// 2.(35): Вам дан массив из чисел. Напишите замыкание, которое превращает число в строку. Примените это замыкание для каждого элемента массива и выведите в консоли.
var list: [Int] = [1, 5, 6, 7, 9, 54, 87, 67, 5, 45, 8]

let toString = { (myNum: Int) in
    return String(myNum)
}

for element in list {
    let elementInString = toString(element)
    print(elementInString + " in type \(type(of: elementInString))")
}

//: [Next](@next)
