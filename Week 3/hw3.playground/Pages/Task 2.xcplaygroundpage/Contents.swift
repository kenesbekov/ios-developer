//: [Previous](@previous)

// 2. (25%): Разверните массив (не использовать reversed())
var myArr = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]

var myArrMaxIndex = myArr.count-1
let range = 0...myArrMaxIndex/2

for i in range {
    let temp = myArr[i]
    myArr[i] = myArr[myArrMaxIndex-i]
    myArr[myArrMaxIndex-i] = temp
}

print(myArr)

//: [Next: Task 3](@next)
