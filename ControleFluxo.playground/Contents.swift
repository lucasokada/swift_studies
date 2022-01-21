import UIKit

func getSubString (str: String?) -> String? {
    guard let myStr = str else {
        return str
    }
    
    let index = myStr.index(myStr.startIndex, offsetBy: 5)
    
    let subStr = myStr[..<index]
    
    return String(subStr)
}

func main() {
    let myString: String? = "that's my optional string"
    
    let mySubString = getSubString(str: myString)
    print(mySubString ?? "nil")
}

main()

enum Grades: Comparable {
    case a
    case b
    case c
    case d
    case f
}

let nota = Grades.c
switch nota {
case .a, .b, .c:
    print("aprovado")
default:
print("nao aprovado")
}

let notaNumerica = 5.6
switch notaNumerica {
case 0 ... 4.99:
    print("abaixo da media")
case 5 ... 10:
    print("acima da media")
default:
    print("nota invalida")
}

let myDog = (namr: "dog", age: 4)
switch myDog {
case (_ , 0 ... 2):
    print("filhote")
default:
    print("adulto")
}

let number = 54
switch number {
case _ where number.isMultiple(of: 2):
    print("multiplo de 2")
case _ where number.isMultiple(of: 3):
    print("multiplo de 3")
default:
    print()
}

//loops-----------

let array = [4, 3, 1, 76, 32]
for element in array {
    print("\(element) ", terminator: "")
}

print()

let dic = [0: "energetico", 1: "refrigerante", 2: "cerveja", 3: "vodka"]
for (key, value) in dic {
    print("id: \(key) product: \(value); ", terminator: "")
}

print()

for num in 1 ... 30 {
    if num.isMultiple(of: 3) {
        print("\(num) ", terminator: "")
    }
}
print()
//equals to:

for num in 1 ... 30 where num.isMultiple(of: 3) {
    print("\(num) ", terminator: "")
}
print()

let tupleArray = [("tempo perdido", "legiao urbana"), ("O tempo nao para", "cazuza")]
for case let ("teste", "cazuza") in tupleArray {
    print("passou aqui")
}

let array2: [Int?] = [1, 5, 7, nil, 6 ,2 , nil]

for case let .some(num) in array2 {
    print("\(num) ", terminator: "")
}
