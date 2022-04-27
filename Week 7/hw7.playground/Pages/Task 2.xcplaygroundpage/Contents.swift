//: [Previous](@previous)
// 2. (35) В магазине техники, есть товары. Некоторые из них сломанные. Создайте сервис который починит всю технику.

//input: [Monitor(broken), Phone(broken), Camera(ok)]
//output: [Monitor(fixed), Phone(fixed), Camera(ok)]

struct Device {
    var name = ""
    var situation = ""
}


struct Fixer {
    var before = Device()
    var after: Device {
        get {
            let name = before.name
            var situation = before.situation
            
            if situation == "broken" { situation = "fixed" }
            else if situation == "not ok" { situation = "ok" }
            return Device(name: name, situation: situation)
        }
        set {
            before.situation = newValue.situation        }
    }
}

var inputArray:[(name: String, situation: String)] = [("Monitor", "broken"), ("Phone", "broken"), ("Camera", "ok")]

var outputArray:[String] = []

for element in inputArray {
    let fixedElement = Fixer(before: Device(name: element.name, situation: element.situation))
    outputArray.append(fixedElement.after.name + "(" + fixedElement.after.situation + ")")
}

print(outputArray)
//: [Next](@next)
