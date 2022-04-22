// 1. (30): Вам даны две переменные и массив с операциями (Пример: +, -, /, *). Примените операции из массива к этим переменным. value обновляется после каждой операции, то есть результат операции приравнивается к value. Выведите в консоли конечный результат value

var value = 10
let target = 2

let operations = ["+", "-", "*", "-", "-", "/", "*", "-", "+", "-"]

for operation in operations {
    switch operation {
    case "+": value += target
    case "-": value -= target
    case "/": value /= target
    case "*": value *= target
    default: print("Incorrect operator")
    }
}

print(value)

//: [Next](@next)
