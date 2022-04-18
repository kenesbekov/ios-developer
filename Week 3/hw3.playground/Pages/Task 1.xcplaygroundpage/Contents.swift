// 1. (15%): Выведите в консоли все простые числа от 1 до 100 (включительно)
let range = 1...100

for myNum in range {
    var isPrime = true
    
    if myNum == 1 {
        isPrime = false
    }
    else if myNum > 3 {
        let checkRange = 2...Int(Double(myNum).squareRoot())
        
        for i in checkRange {
            if myNum % i == 0 {
                isPrime = false
            }
        }
    }
    
    if isPrime {
        print(myNum)
    }
}

//: [Next: Task 2](@next)
