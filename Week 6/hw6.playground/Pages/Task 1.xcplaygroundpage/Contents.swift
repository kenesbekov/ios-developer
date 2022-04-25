// 1. (20) Постройте массив из точных чисел, использую `list`
var list = [3, 4, nil, 5, 7, nil, 8, 5, 3, 3, nil, 2, 2, 2, 5]

var myArr: [Int] = list.compactMap{ $0 }
print(myArr)
//: [Next](@next)
