//: [Previous](@previous)
// 2. (30) Представьте что ваше приложение поддерживает авторизацию по логин и паролю. Но есть вероятность что бизнес в будущем запросит добавить авторизацию через Google & Facebook. Вам надо сделать так чтоб добавление способов авторизации было безболезненным
enum Auth {
    case login
    case google
    case facebook

    func login() {
        print("Login with login and password")
    }
    func google() {
        print("Login with Google")
    }
    func facebook() {
        print("Login with Facebook")
    }
}

let authType: Auth = .login
switch authType {
case .login: authType.login()
case .google: authType.google()
case .facebook: authType.facebook()
}

//: [Next](@next)
