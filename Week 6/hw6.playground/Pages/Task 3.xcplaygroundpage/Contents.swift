//: [Previous](@previous)
// 3. (20) Найдите количество уникальных элементов из массива полученного с предыдущего задания

var array = [3, [4, 5], [7, [8, 5]], [3, [3, [2, [2], 2], 5]]] as [Any]

func flattenedArray(array:[Any]) -> [Int] {
    var myArray = [Int]()
    array.map { (element) -> Void in
        if let element = element as? Int {
            myArray.append(element)
        }
        if let element = element as? [Any] {
            myArray.append(contentsOf: flattenedArray(array: element))
        }
    }
    return myArray
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

var flatArray = flattenedArray(array: array)
var uniquedFlatArray = flatArray.uniqued()

print("Number of unique elements is: \(uniquedFlatArray.count)\n")

print("Array changes:\n1. \(array)\n2. \(flatArray)\n3. \(uniquedFlatArray)")
//: [Next](@next)
