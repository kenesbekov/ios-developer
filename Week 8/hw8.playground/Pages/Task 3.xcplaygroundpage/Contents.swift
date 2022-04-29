//: [Previous](@previous)
// 3. (40) Создать протокол-сервис, который может:
// Реализовать этот сервис.
protocol Product {
    var id: Int { get set }
    var name: String { get set }
    var manufacturer: String { get set }
}

protocol Shop {
    func add(_ product: Product)-> Bool

    func delete(productBy id: Int) -> Bool

    func productList() ->[Product]
    
    func randomFiftyProducts()
    
    func getProductNames() -> [String]
    
    func searchProduct(_ productName: String) -> Product
    
    func clear()
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
        if id < products.count {
            let removedProduct = products.remove(at: id)
            if type(of: removedProduct) == Product.self {
                return true
            }
        }
        return false
    }
    
    func productList() -> [Product] {
        products
    }
    
    func randomFiftyProducts() {
        for i in 0..<50 {
            let productName = randomString(of: 10)
            let companyName = randomString(of: 10)
            
            let someProduct: Product = ProductClass(i, productName, companyName)
            add(someProduct)
        }
    }
    
    func getProductNames() -> [String] {
        var productNames: [String] = []
        for product in products {
            productNames.append(product.name)
        }
        return productNames
    }
    
    func searchProduct(_ productName: String) -> Product {
        let anyProduct: Product = ProductClass(0, "SomeName", "SomeManufacture")
        for product in products {
            if product.name == productName {
                return product
            }
        }
        return anyProduct
    }
    
    func clear() {
        products.removeAll()
    }
}

func printer(_ products: [Product]) {
    for product in products {
        print("Product with id \(product.id) is " + product.name)
    }
}

func randomString(of length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyz"
    var s = ""
    for _ in 0 ..< length {
        s.append(letters.randomElement()!)
    }
    return s
}

var someShop: Shop = ShopClass()

//- генерировать случайных 50 товаров и добавлять их в наш магазин. (id - должны быть разными)
someShop.randomFiftyProducts()
printer(someShop.productList())
print()

//- найти все товары по названию и удалить их.
let shopProductNames = someShop.getProductNames()
for productName in shopProductNames {
    someShop.delete(productBy: someShop.searchProduct(productName).id)
}
printer(someShop.productList())
print()

//- очистить магазин.
someShop.randomFiftyProducts()
someShop.clear()
printer(someShop.productList())
