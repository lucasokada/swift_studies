import UIKit

var greeting = "Hello, playground"

class Names {
    private var names = ["lucas", "celso", "sonia", "cesar"]
    public subscript(index: Int) -> String {
        get {
            return names[index]
        }
        
        set {
            names[index] = newValue
        }
    }
}

struct Hello {
    static subscript(name: String) -> String{
        return "Hello \(name)"
    }
}

struct MathTable {
    private var num: Int
    
    subscript(multiply index: Int) -> Int {
        return num * index
    }
    
    subscript(add index: Int) -> Int {
        return num + index
    }
    
    init(num: Int) {
        self.num = num
    }
}

struct TicTacToe {
    private var board = [["", "", ""], ["", "", ""], ["", "", ""]]
    subscript(x: Int, y: Int) -> String {
        get {
            return board[x][y]
        }
        
        set {
            board[x][y] = newValue
        }
    }
}

var names = Names()
let name = names[3]
print("name = \(name)")


let hello = Hello[names[2]]
print("\(hello)")

var table = MathTable(num: 6)
print(table[multiply: 3])
print(table[add: 9])

var board = TicTacToe()
board[1, 1] = "x"
board[0, 0] = "o"

// DYNAMIC MEMBER LOOKUP

@dynamicMemberLookup //assim
struct BaseballTeam {
    private let city: String
    private let nickname: String
    
    func fullName() -> String { //ou assim
        return "\(city) \(nickname)"
    }
    
    init(city: String, nickname: String) {
        self.city = city
        self.nickname = nickname
    }
    
    subscript(dynamicMember key: String) -> String {
        switch key {
        case "fullname":
            return "\(city) \(nickname)"
        case "city":
            return "\(city)"
        case "nickname":
            return "\(nickname)"
        default:
            return "unknow request"
        }
    }
}

var baseballTeam = BaseballTeam(city: "Boston", nickname: "Red Sox")
print("The \(baseballTeam.nickname ) won in \(baseballTeam.city) city")



