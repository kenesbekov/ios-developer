//: [Previous](@previous)
// 3. (35) У вас есть объекты Магазин(Shop) и Касса(Cash). Магазин может покупать (если бюджет позволяет) и продавать товары. У магазина есть прямой доступ к кассе, а у покупателей нет. Реализуйте эту схему.

//Нужно реализовать методы `buy(_ product: Product)` и `sell(_ product: Product)` у класса Shop.
struct Product {
    let name: String
    let price: Int
}

class Shop {
    private var budget: Cashbox
    private var stock: Stock
    
    init(_ budget: Cashbox, _ stock: Stock) {
        self.budget = budget
        self.stock = stock
    }
    
    func buy(_ product: Product) {
        if budget.total() >= product.price {
            print("Shop bought \(product.name)")
            stock.addItem(product.name)
            budget.minus(product.price)
        } else {
            print("Sorry, shop has no enough money to buy \(product.name)")
        }
    }
    
    func sell(_ product: Product) {
        if stock.items.contains(product.name) {
            print("Shop sold \(product.name)")
            stock.minus(product.name)
        } else {
            print("Sorry, shop doesn't have \(product.name)")
        }
    }
}

class Cashbox {
    private var moneyCount: Int
    
    init() {
        self.moneyCount = 9999
    }
    
    func total() -> Int {
        moneyCount
    }
    
    func minus(_ cost: Int) {
        moneyCount -= cost
    }
}

class Stock {
    let address: String
    var items: [String]
    
    init(_ address: String) {
        self.address = address
        items = []
    }
    
    func addItem(_ item: String) {
        items.append(item)
    }
    
    func minus(_ item: String) {
        for i in 0..<items.count {
            if items[i] == item {
                items.remove(at: i)
            }
        }
    }
}

var someCashbox: Cashbox = Cashbox()
var someStock: Stock = Stock("NYC")
var someShop: Shop = Shop(someCashbox, someStock)

var someProduct1 = Product(name: "Bread", price: 190)
var someProduct2 = Product(name: "Lamp", price: 10900)

someShop.buy(someProduct1)
someShop.buy(someProduct2)
someShop.sell(someProduct1)
someShop.sell(someProduct2)
