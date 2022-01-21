import UIKit

public class Planta {
    private var name: String
    
    private var heigth: Double {
        get {
            self.heigth
        }
        
        set(newHeigth) {
            self.heigth = newHeigth
        }
    }
    
    private var age: Int {
        get {
            self.age
        }
        
        set(newAge) {
            self.age = newAge
        }
    }
    
    init(name: String) {
        self.name = name
        self.heigth = 0.0
        self.age = 0
    }
    
    init(name: String, heigth: Double, age: Int) {
        self.name = name
        self.heigth = heigth
        self.age = age
    }
    
    func getHeigth() -> Double {
        return self.heigth
    }
}

var planta = Planta(name: "Planta1")
print("\(planta.getHeigth())")


public class arvora: Planta {
}
