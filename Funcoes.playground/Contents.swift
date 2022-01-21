import UIKit

func hello0(name: String, greeting: String) {
    print("\(greeting) \(name)")
}

func hello(name: String, greeting: String) -> String {
    return "\(greeting) \(name)"
}

func hello2(personName name: String, usedGreeting greeting: String) -> String { //external names
    //dentro da func se usa os internal names
    "\(greeting) \(name)" //return pode ser omitido
}

func hello3(name: String, greeting: String = "Bonjour") -> String { // default value
    "\(greeting) \(name)"
}

func hello4(_ name: String, greeting: String) -> String {   //parametro1 pode ser omitido
    "\(greeting) \(name)"
}

//pode retornar opcionais, collections, tuplas e etc ...

//======================================================

hello0(name: "Lucas", greeting: "Hello") //sem retorno

let greeting1 = hello(name: "Lucas", greeting: "Hi")
print(greeting1)

let greeting2 = hello2(personName: "Lucas", usedGreeting: "Hello") //na chamada se usa os external names
print(greeting2)

let greeting3 = hello3(name: "Lucas") //pode ser passado utilizando 1 parametro
let greeting4 = hello3(name: "Lucas", greeting: "Hello") //ou os 2 -> override

print(greeting3)
print(greeting4)

let greeting5 = hello4("Lucas", greeting: "Olá") //label do parametro nome DEVE ser omitido
//let greeting6 = hello4(name: "Lucas", greeting: "Oi") // nao permitido, o parametro deve ser omitido
print(greeting5)
//print(greeting6)

