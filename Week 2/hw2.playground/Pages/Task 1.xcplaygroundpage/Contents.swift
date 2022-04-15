//task1 - Попробуйте нарисовать в консоли Playground ёлку
let height = 7
let width = 11

for i in 0...height {
    if i < 5 {
        for j in 0...width {
            if j == 5 - i {
                print("/", terminator: "")
            }
            else if j == 6 + i {
                print("\\", terminator: "")
            }
            else {
                print(" ", terminator: "")
            }
        }
        print("")
    }
    else if i == 5 {
        for j in 0...width {
            if j == 1 || j == 3 || j == 8 || j == 10 {
                print("-", terminator: "")
            }
            else {
                print(" ", terminator: "")
            }
        }
        print("")
        
    }
    else if i == 6 {
        for j in 0...width {
            if j == 4 || j == 7 {
                print("|", terminator: "")
            }
            else {
                print(" ", terminator: "")
            }
        }
        print("")
    }
    else if i == 7 {
        for _ in 0...width {
            print("-", terminator: "")
        }
    }
}

//: [Next: Task 2](@next)
