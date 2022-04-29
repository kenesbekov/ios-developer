//: [Previous](@previous)
// 2. (35) Реализовать эти методы в созданной сущности.
protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
}

protocol Shop {
    func add(_ product: Product)-> Bool

    func delete(productBy id: Int) -> Bool

    func productList() ->[Product]
    
    func searchProduct(_ productName: String) -> Product
    
    func firstTenProducts() -> ArraySlice<Product>
}

class ProductClass: Product {
    var id: Int
    
    var name: String
    
    var manufacturer: String
    
    init(_ id: Int, _ name: String, _ manufacturer: String) {
        self.id = id
        self.name = name
        self.manufacturer = manufacturer
    }
}

class ShopClass: Shop {
    
    var products: [Product] = []
    
    func add(_ product: Product) -> Bool {
        products.append(product)
        return true
    }
    
    func delete(productBy id: Int) -> Bool {
        let removedProduct = products.remove(at: id)
        if type(of: removedProduct) == Product.self {
            return true
        }
        return false
    }
    
    func productList() -> [Product] {
        products
    }
    
    func searchProduct(_ productName: String) -> Product {
        let anyProduct: Product = ProductClass(0, "SomeName", "SomeManufacture")
        for product in products {
            if product.name == productName {
                print("Shop has " + productName)
                return product
            }
        }
        return anyProduct
    }
    
    func firstTenProducts() -> ArraySlice<Product> {
        let sortedProducts: [Product] = productList().sorted { $0.name < $1.name }
        return sortedProducts[0..<10]
    }
}

func printer(_ products: [Product]) {
    for product in products {
        print(product.name, terminator: " ")
    }
}

func printer(_ products: ArraySlice<Product>) {
    for product in products {
        print(product.name, terminator: " ")
    }
}


var someShop: Shop = ShopClass()

let someProduct1: Product = ProductClass(1, "Orange", "CompanyInc")
let someProduct2: Product = ProductClass(2, "Banana", "CompanyInc")
let someProduct3: Product = ProductClass(3, "Spoon", "CompanyInc")
let someProduct4: Product = ProductClass(4, "Bread", "CompanyInc")
let someProduct5: Product = ProductClass(5, "Apple", "CompanyInc")
let someProduct6: Product = ProductClass(6, "Lemon", "CompanyInc")
let someProduct7: Product = ProductClass(7, "Cola", "CompanyInc")
let someProduct8: Product = ProductClass(8, "Grapefruit", "CompanyInc")
let someProduct9: Product = ProductClass(9, "Halva", "CompanyInc")
let someProduct10: Product = ProductClass(10, "Juice", "CompanyInc")
let someProduct11: Product = ProductClass(11, "Carrot", "CompanyInc")
let someProduct12: Product = ProductClass(12, "Lolipop", "CompanyInc")

someShop.add(someProduct1)
someShop.add(someProduct2)
someShop.add(someProduct3)
someShop.add(someProduct4)
someShop.add(someProduct5)
someShop.add(someProduct6)
someShop.add(someProduct7)
someShop.add(someProduct8)
someShop.add(someProduct9)
someShop.add(someProduct10)
someShop.add(someProduct11)
someShop.add(someProduct12)

// Добавить в протокол метод, который будет искать все товары по имени и возвращать их.
someShop.searchProduct("Cola")
// Добавить метод, который будет возвращать 10 первых товаров из всех отсортированных товаров по имени.
printer(someShop.firstTenProducts())
//: [Next](@next)
