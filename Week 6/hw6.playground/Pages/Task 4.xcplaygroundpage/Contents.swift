//: [Previous](@previous)
// 4. (35) Преобразуйте многоуровневый массив в одномерный. Массив может хранить данные любого типа (Int, String, Double)
var array = [3, [4, 5], [7, [8, 5]], [3, [3, [2, [2], 2], 5]], ["hello", "world"], 4.0] as [Any]

func flattenedArray(array:[Any]) -> [Any] {
    var myArray = [Any]()
    array.map { (element) -> Void in
        if let element = element as? Int {
            myArray.append(element)
        }
        if let element = element as? String {
            myArray.append(element)
        }
        if let element = element as? Double {
            myArray.append(element)
        }
        if let element = element as? [Any] {
            myArray.append(contentsOf: flattenedArray(array: element))
        }
    }
    return myArray
}

array = flattenedArray(array: array)
print(array)
