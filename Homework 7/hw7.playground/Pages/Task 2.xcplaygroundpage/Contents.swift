//: [Previous](@previous)
// 2. (35) В магазине техники, есть товары. Некоторые из них сломанные. Создайте сервис который починит всю технику.

//input: [Monitor(broken), Phone(broken), Camera(ok)]
//output: [Monitor(fixed), Phone(fixed), Camera(ok)]

enum statusType {
    case broken
    case fixed
    case notOk
    case ok
}

class Device {
    var name: String
    var status: statusType
    
    init(_ name: String, _ status: statusType) {
        self.name = name
        self.status = status
    }
}

class Monitor: Device {
    init(_ status: statusType) {
        super.init("Monitor", status)
    }
}

class Phone: Device {
    init(_ status: statusType) {
        super.init("Phone", status)
    }
}

class Camera: Device {
    init(_ status: statusType) {
        super.init("Camera", status)
    }
}

var inputArr = [Monitor(statusType.broken), Phone(statusType.broken), Camera(statusType.ok)]

for device in inputArr {
    switch device.status {
    case .broken: device.status = .fixed
    case .notOk: device.status = .ok
    case .fixed: continue
    case .ok: continue
    }
}

for device in inputArr {
    print(device.name, device.status)
}
//: [Next](@next)
