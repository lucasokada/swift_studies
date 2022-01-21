import UIKit

protocol FiguraGeometrica {
    var numeroLados: Int { get }
    var vertice: Int { get }
    
    func calcArea() -> Double
    func calcPerimetro() -> Double
}

extension FiguraGeometrica {
    var somaAngulosInternos: Int {
        get {
            return (numeroLados - 2) * 180
        }
    }
    
    var somaAngulosExternos: Int {
        get {
            return 360
        }
    }
}

protocol Triangulo: FiguraGeometrica {
    var numeroLados: Int { get }
    var vertice: Int { get }
    
    func calcArea() -> Double
    func calcPerimetro() -> Double
}

extension Triangulo {
    var numeroLados: Int {
        get {
            return 3
        }
    }
    
    var vertice: Int {
        get {
            return 3
        }
    }
}

class TrianguloEquilatero: Triangulo {
    private(set) var valorLado: Double
    private var lados: Array<Double>
    var altura: Double {
        get {
            return valorLado * pow(3, 1/2) / 2
        }
    }
    
    func calcArea() -> Double {
        return pow(valorLado, 2) * pow(3, 1/2) / 4
    }
    
    func calcPerimetro() -> Double {
        return valorLado * 3
    }
    
    init(valorLado: Double) {
        self.valorLado = valorLado
        self.lados = [valorLado, valorLado, valorLado]
    }
}

class TrianguloIsoceles: Triangulo {
    private(set) var valorLado: Double
    private(set) var base: Double
    private var lados: Array<Double>
    
    var altura: Double {
        get {
            return pow(pow(valorLado, 2) - (pow(base, 2) / 4), 1/2)
        }
    }
    
    func calcArea() -> Double {
        return base * altura / 2
    }
    
    func calcPerimetro() -> Double {
        return 2 * valorLado + base
    }
    
    init(valorLado: Double, base: Double) {
        self.valorLado = valorLado
        self.base = base
        self.lados = [valorLado, valorLado, base]
    }
}

protocol Quadrilatero: FiguraGeometrica {
    var ladoValor: [Double] { get }
}

extension Quadrilatero {
        
    var numeroLados: Int {
        get {
            return 4
        }
    }
    
    var vertice: Int {
        get {
            return 4
        }
    }
}

class Quadrado: Quadrilatero {
    private(set) var lado: Double
    private(set) var ladoValor: [Double]
    
    func calcArea() -> Double {
        return ladoValor[0] * ladoValor[0]
    }
    
    func calcPerimetro() -> Double {
    
        return ladoValor[0] * 4
    }
    
    init(lado: Double) {
        self.lado = lado
        self.ladoValor = [lado, lado, lado, lado]
    }
}

class Retangulo: Quadrilatero {
    private(set) var base: Double
    private(set) var altura: Double
    private(set) var ladoValor: [Double]
    
    func calcArea() -> Double {
        return base * altura
    }
    
    func calcPerimetro() -> Double {
        var somaDosLados = 0.0
        
        for lado in ladoValor {
            somaDosLados += lado
        }
        
        return somaDosLados
    }
    
    init(base: Double, altura: Double) {
        self.base = base
        self.altura = altura
        self.ladoValor = [base, altura, base, altura]
    }
}

var quadrado = Quadrado(lado: 5)
print("area: \(quadrado.calcArea())")
print("perimetro: \(quadrado.calcPerimetro())")
print("soma internos: \(quadrado.somaAngulosInternos)")
print("soma externos: \(quadrado.somaAngulosExternos)")

print()

var retangulo = Retangulo(base: 5, altura: 8)
print("area: \(retangulo.calcArea())")
print("perimetro: \(retangulo.calcPerimetro())")
print("soma internos: \(retangulo.somaAngulosInternos)")
print("soma externos: \(retangulo.somaAngulosExternos)")


var formasGeometricasArray: Array<FiguraGeometrica> = []
formasGeometricasArray.append(Quadrado(lado: 6))
formasGeometricasArray.append(Quadrado(lado: 4.65))
formasGeometricasArray.append(Retangulo(base: 4.32, altura: 7.656))
formasGeometricasArray.append(Quadrado(lado: 120))
formasGeometricasArray.append(Retangulo(base: 443.2, altura: 21.44))

print()

for quadrilatero in formasGeometricasArray where quadrilatero.calcArea() >= 400 {
    
    switch quadrilatero {
    case is Quadrado:
        print("Quadrado")
    case is Retangulo:
        print("Reetangulo")
    default:
        print("Any")
    }
    
    print("area: \(quadrilatero.calcArea())")
    print("perimetro: \(quadrilatero.calcPerimetro())")
    print("soma internos: \(quadrilatero.somaAngulosInternos)")
    print("soma externos: \(quadrilatero.somaAngulosExternos)")
    print()
}

if formasGeometricasArray[3] is Quadrado {
    print("array[3] é quadrado")
}

print("Triangulo Equilatero")
var trianguloEquilatero = TrianguloEquilatero(valorLado: 5)
print("altura = \(trianguloEquilatero.altura)")
print("area: \(trianguloEquilatero.calcArea())")
print("perimetro: \(trianguloEquilatero.calcPerimetro())")
print("soma internos: \(trianguloEquilatero.somaAngulosInternos)")
print("soma externos: \(trianguloEquilatero.somaAngulosExternos)")

print()

print("Triangulo Isoceles")
var trianguloIsoceles = TrianguloIsoceles(valorLado: 7, base: 3)
print("altura = \(trianguloIsoceles.altura)")
print("area: \(trianguloIsoceles.calcArea())")
print("perimetro: \(trianguloIsoceles.calcPerimetro())")
print("soma internos: \(trianguloIsoceles.somaAngulosInternos)")
print("soma externos: \(trianguloIsoceles.somaAngulosExternos)")

