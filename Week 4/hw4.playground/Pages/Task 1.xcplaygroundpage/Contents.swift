// 1. (10) Преобразуйте данный массив таким образом, чтоб на выходе массив хранил точные значения

let array: [Any?] = [0, nil, "String", 4.5, Optional(true)]

var myArr = array.compactMap{ $0 }
print(myArr)

//: [Next](@next)
