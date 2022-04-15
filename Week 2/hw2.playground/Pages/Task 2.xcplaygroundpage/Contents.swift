//: [Previous](@previous)

//task2 - Выведите в консоли все двузначные числа от 1 до 150, которые делятся на себя и на 3 (Используйте while)
var myNum = 1
while myNum <= 150 {
    if myNum / 10 >= 1, myNum / 10 < 10, myNum % 3 == 0 {
        print(myNum)
    }
    myNum += 1
}

//: [Next: Task 3](@next)

