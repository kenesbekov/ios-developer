// 1. (25): Создайте модель Shape, и добавьте в него функцию area(), которая высчитывает площадь фигуры. Далее, создайте сабклассы Rectangle, Square и Circle. Выведите в консоли площади всех фигур
class Shape {
    var width: Double
    var height: Double
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
    
    func area() {
        print("Shape area is " + String(Int(height * width)))
    }
}

class Rectangle: Shape {
    override init(height: Double, width: Double) {
        super.init(height: height, width: width)
    }
    override func area() {
        print("Rectangle area is " + String(Int(height * height)))
    }
}

class Square: Shape {
    init(height: Double) {
        super.init(height: height, width: height)
    }
    override func area() {
        print("Square area is " + String(Int(height * height)))
    }
}

class Circle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
        super.init(height: radius, width: radius)
    }

    override func area() {
        print("Circle area is " + String(3.14 * radius * radius))
    }
}

let someShape = Shape(height: 10, width: 20)
someShape.area()

let someRectangle = Rectangle(height: 20, width: 30)
someRectangle.area()

let someSquare = Square(height: 20)
someSquare.area()

let someCircle = Circle(radius: 2)
someCircle.area()

//: [Next](@next)
