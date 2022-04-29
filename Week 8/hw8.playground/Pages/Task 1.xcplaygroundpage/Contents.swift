// 1. (20) Создать сущности, которые реализуют данные протоколы. Реализовать методы так, чтобы мы могли корректно пользоваться протоколом.
protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
}

protocol Shop {
    /// Добавить товар в магазин, если его нет.
    /// Возвращает успешное добавление.
    func add(_ product: Product)-> Bool

    /// Удалить товар по ID из магазина, если он есть.
    /// Возвращает успешное удаление.
    func delete(productBy id: Int) -> Bool

    /// Вывести все продукты в магазине
    func productList() ->[Product]
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
}

func printer(_ products: [Product]) {
    for product in products {
        print(product.name, terminator: " ")
    }
}

var someShop: Shop = ShopClass()

let someProduct: Product = ProductClass(0, "Bread", "Aqsai")
let anotherProduct: Product = ProductClass(1, "Juice", "Juicy")

someShop.add(someProduct)
someShop.add(anotherProduct)
printer(someShop.productList())
print()

someShop.delete(productBy: 1)
printer(someShop.productList())
//: [Next](@next)
