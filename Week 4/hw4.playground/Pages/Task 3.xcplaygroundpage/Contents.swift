//: [Previous](@previous)
// 3. Определите

enum Weekday: Int {
   case Monday = 1, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

let date = 12
let day: Weekday = .Tuesday


func nameOfWeekday(numberOfWeekday: Int) -> String {
    switch numberOfWeekday {
        case 1: return "Monday"
        case 2: return "Tuesday"
        case 3: return "Wednesday"
        case 4: return "Thursday"
        case 5: return "Friday"
        case 6: return "Saturday"
        case 7, 0: return "Sunday"
        default: return "Incorrect number of weekday"
    }
}

func getWeekday(_ date: Int, _ day: Weekday, _ someDate: Int) -> String {
    /*
    the way of working
    abs(24 - 12) = 12
    12 % 7 = 5
    Tuesday + 5
    2 + 5 = 7
    7 % 7 = 0
    nameOfWeekday(7) = Sunday
    */
    
    let numberOfCurrentWeekday = day.rawValue
    let dateDifference = abs(date - someDate) % 7
    var weekdayDifference: Int

    if someDate >= date {
        weekdayDifference = numberOfCurrentWeekday + dateDifference
    } else if numberOfCurrentWeekday < dateDifference {
        weekdayDifference = 7 - abs(numberOfCurrentWeekday - dateDifference)
    } else {
        weekdayDifference = abs(numberOfCurrentWeekday - dateDifference)
    }

    return nameOfWeekday(numberOfWeekday: weekdayDifference % 7)
}


//(25) День недели 24 числа
print("1. 24th of that month is \(getWeekday(date, day, 24))")

//(25) С какого дня недели начался этот месяц
print("2. First weekday of that month is \(getWeekday(date, day, 1))")

//(25) Число последней пятницы
var maxNumOfDaysInThatMonth = 30

while maxNumOfDaysInThatMonth > 0 {
    if getWeekday(date, day, maxNumOfDaysInThatMonth) == "Friday" {
        print("3. Last Friday of that month is \(maxNumOfDaysInThatMonth)")
        break
    }
    maxNumOfDaysInThatMonth -= 1
}
