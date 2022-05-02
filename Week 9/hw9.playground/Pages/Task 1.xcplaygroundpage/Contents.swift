// 1. (30) let operations = [Addition, Subtraction, Multiplication, Division, Division]
var value = 10
let target = 2
// Пройдитесь по массиву, и вызовите одну общую для всех функцию, для каждого элемента массива

protocol OperationsProtocol {
    var value: Int { get }
    var target: Int { get }
}

struct Addition: OperationsProtocol {
    var value: Int
    let target: Int
    
    init(value: Int, target: Int) {
        self.target = target
        self.value = value + target
    }
}

struct Subtraction: OperationsProtocol {
    var value: Int
    let target: Int
    
    init(value: Int, target: Int) {
        self.target = target
        self.value = value - target
    }
}

struct Multiplication: OperationsProtocol {
    var value: Int
    let target: Int
    
    init(value: Int, target: Int) {
        self.target = target
        self.value = value * target
    }
}

struct Division: OperationsProtocol {
    var value: Int
    let target: Int
    
    init(value: Int, target: Int) {
        self.target = target
        self.value = value / target
    }
}

func configure(with viewModel: OperationsProtocol) {
    value = viewModel.value
}

let operations = ["Addition", "Subtraction", "Multiplication", "Division", "Division"]

for operation in operations {
    switch operation {
    case "Addition": configure(with: Addition(value: value, target: target) as OperationsProtocol)
    case "Subtraction": configure(with: Subtraction(value: value, target: target) as OperationsProtocol)
    case "Multiplication": configure(with: Multiplication(value: value, target: target) as OperationsProtocol)
    case "Division": configure(with: Division(value: value, target: target) as OperationsProtocol)
    default: print("Incorrect operation type")
    }
}
print(value)

//: [Next](@next)
