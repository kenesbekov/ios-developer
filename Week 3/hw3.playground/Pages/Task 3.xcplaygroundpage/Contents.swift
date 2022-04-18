//: [Previous](@previous)

// 3. (25%): Отсортируйте данный массив таким образом, чтоб все нули ушли в конец, при этом порядок не нулевых чисел не менялся. При решении задачи если учитывать Time Complexity (+10 балл бонуса)
var myArr = [0, 6, 2, 0, 0, 4, 5, 3, 3, 6, 0, 7, 9, 4, 5, 0, 5, 7, 0, 0]

var i = 0
var zeroCnt = 0
while i < myArr.count - zeroCnt {
    if myArr[i] == 0 {
        zeroCnt += 1
        myArr.remove(at: i)
        myArr.append(0)
    }
    else {
        i += 1
    }
}
print(myArr)

//: [Next: Task 4](@next)
