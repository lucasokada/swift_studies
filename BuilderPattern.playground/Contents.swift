import UIKit

//metodo tradicional
struct BurgerOld {
    var name: String
    var patties: Int
    var bacon: Bool
    var cheese: Bool
    var pickles: Bool
    var ketchup: Bool
    var mustard: Bool
    var lettuce: Bool
    var tomato: Bool
    
    init(name: String, patties: Int, bacon: Bool, cheese: Bool, pickles: Bool, ketchup: Bool, mustard: Bool, lettuce: Bool, tomato: Bool) {
        self.name = name
        self.patties = patties
        self.bacon = bacon
        self.cheese = cheese
        self.pickles = pickles
        self.ketchup = ketchup
        self.mustard = mustard
        self.lettuce = lettuce
        self.tomato = tomato
    }
}

let myBurger = BurgerOld(name: "Big Burger", patties: 2, bacon: true, cheese: true, pickles: true, ketchup: true, mustard: true, lettuce: true, tomato: true)

//----------------------------------------------------------------------------------------------------

protocol BurgerBuilder {
    var name: String {get}
    var patties: Int {get}
    var bacon: Bool {get}
    var cheese: Bool  {get}
    var pickles: Bool {get}
    var ketchup: Bool {get}
    var mustard: Bool {get}
    var lettuce: Bool {get}
    var tomato: Bool {get}
}

struct HamburgerBuilder: BurgerBuilder {
    var name = "Burger"
    var patties = 1
    var bacon = false
    var cheese = false
    var pickles = true
    var ketchup = true
    var mustard = true
    var lettuce = false
    var tomato = false
}

struct CheeseBurgeBuilder: BurgerBuilder {
    var name = "CheeseBurger"
    var patties = 1
    var bacon = false
    var cheese = true
    var pickles = true
    var ketchup = true
    var mustard = true
    var lettuce = false
    var tomato = false
}

struct Burger {
    var name: String
    var patties: Int
    var bacon: Bool
    var cheese: Bool
    var pickles: Bool
    var ketchup: Bool
    var mustard: Bool
    var lettuce: Bool
    var tomato: Bool
    
    init(builder: BurgerBuilder) {
        self.name = builder.name
        self.patties = builder.patties
        self.bacon = builder.bacon
        self.cheese = builder.cheese
        self.pickles = builder.pickles
        self.ketchup = builder.ketchup
        self.mustard = builder.mustard
        self.lettuce = builder.lettuce
        self.tomato = builder.tomato
    }
    
    mutating func setPatties(patties: Int) {
        self.patties = patties
    }
    
    mutating func setBacon(bacon: Bool) {
        self.bacon = bacon
    }
}

var myBurger2 = Burger(builder: HamburgerBuilder())
var myCheeseburger = Burger(builder: CheeseBurgeBuilder())
myCheeseburger.lettuce = false

