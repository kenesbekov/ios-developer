//: [Previous](@previous)

// 4. (30%): Вам дан массив из чисел. Выведите в консоли элементы массива по убыванию их количества
var myArr = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]

var numCnt: [Int: Int] = [:]

for num in myArr {
    numCnt[num] = (numCnt[num] ?? 0) + 1
}

for (key, value) in numCnt.sorted(by: {$0.1 > $1.1}) {
    print("Элемент \(key) в количестве \(value)")
}
