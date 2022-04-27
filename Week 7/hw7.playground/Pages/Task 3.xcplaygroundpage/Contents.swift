//: [Previous](@previous)
// 3. (35) У вас есть 2 типа вагона. Пассажирский и грузовой. Пассажирский вагон весит 2000 кг, грузовой 1500 кг. Пассажирский вагон вмещает до 30 пассажиров, средний вес пассажира 60 кг. Грузовой вагон сможет понести груз любого веса. Представьте что ваш поезд состоит из нескольких вагонов. Посчитайте общий вес поезда.

//input: [Passenger(23), Cargo(500kg), Cargo(600kg)]
//output: 7480kg

class Passenger {
    var numberOfPassengers: Int
    var selfWeight: Int

    init(_ numberOfPassengers: Int) {
        self.numberOfPassengers = numberOfPassengers
        self.selfWeight = 2000
    }

    func total() -> Int {
        numberOfPassengers * 60 + selfWeight
    }
}


class Cargo {
    var baggage: Int
    var selfWeight: Int

    init(_ baggage: Int) {
        self.baggage = baggage
        self.selfWeight = 1500
    }

    func total() -> Int {
        baggage + selfWeight
    }
}

print(String(Passenger(23).total() + Cargo(500).total() + Cargo(600).total()) + "kg")
