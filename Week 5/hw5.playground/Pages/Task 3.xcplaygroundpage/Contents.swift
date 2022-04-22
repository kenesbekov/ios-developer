//: [Previous](@previous)
// 3. (30): Напишите функцию, которое выводит в консоли i-тое значение фибоначчи
func phi(_ n: Int) -> Int {
    if n <= 1 { return n }
    return phi(n - 1) + phi(n - 2);
}

let i = 12

print(phi(i))


