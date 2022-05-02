//: [Previous](@previous)
// 3. (35) У вас есть объекты Магазин и Касса. Магазин может покупать (если бюджет позволяет) и продавать товары. У магазина есть прямой доступ к кассе, а у покупателей нет. Реализуйте эту схему
class Shop {
    private var budget: Cashbox
    private var stock: Stock
    
    init(_ budget: Cashbox, _ stock: Stock) {
        self.budget = budget
        self.stock = stock
    }
    
    func buy(_ item: String, _ cost: Int) {
        if budget.total() >= cost {
            print("Shop bought \(item)")
            stock.addItem(item)
            budget.minus(cost)
        } else {
            print("Sorry, shop has no enough money to buy \(item)")
        }
    }
    
    func sell(_ item: String) {
        if stock.items.contains(item) {
            print("Shop sold \(item)")
            stock.minus(item)
        } else {
            print("Sorry, shop doesn't have \(item)")
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

someShop.buy("Bread", 190)
someShop.buy("Lamp", 10900)
someStock.addItem("Milk")
someShop.sell("Milk")
someShop.sell("Milk")
