//: [Previous](@previous)
// 2. (20) Уберите дупликаты из массива полученного с предыдущего задания
var list = [3, 4, 5, 7, 8, 5, 3, 3, 2, 2, 2, 5]

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

var myArr = list.uniqued()
print(myArr)
//: [Next](@next)
