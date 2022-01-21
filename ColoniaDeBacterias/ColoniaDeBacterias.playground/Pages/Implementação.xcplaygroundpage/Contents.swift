//: [Anterior](@previous)
//: # Implementação

import Foundation

func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
    var chars = Array(myString)     // gets an array of characters
    chars[index] = newChar
    let modifiedString = String(chars)
    return modifiedString
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

class Colonia {
    typealias Coordenate = (x: Int, y: Int)
    private(set) var matrix : Array<String>
    private(set) var lines  = 0
    private(set) var rows = 0
    private(set) var controlPointQuantity = 0
    private(set) var bacteriumQuantity = 0
    
    init(matrix : Array<String>) {
        self.matrix = matrix
        setRows()
        setLines()
        getControlPointQuantity()
        getBacteriumQuantity()
    }
    
    private func getBacteriumQuantity() {
        var number = 0
        for i in 0 ... lines - 1 {
            for j in 0 ... rows - 1 {
                if matrix[i][j] == "👾" {
                    number += 1
                }
            }
        }
        
        bacteriumQuantity = number
    }
    
    func setLines() {
        lines = matrix.count
    }
    
    func setRows() {
        rows = matrix[0].count
    }
    
    func getControlPointQuantity() {
        var number = 0
        for i in 0 ... lines - 1 {
            for j in 0 ... rows - 1 {
                if matrix[i][j] == "🚩" {
                    number += 1
                }
            }
        }
        
        controlPointQuantity = number
    }
    
    func validPosition(i: Int, j: Int) -> Bool {
        if matrix[i][j] != "👾" && i >= 0 && i < lines && j >= 0 && j < rows {
            return true
        }
        
        return false
    }
    
    func isBoard(i: Int, j: Int) -> Bool {
        if i == 0 || i == lines - 1 || j == 0 || j == rows - 1 {
            return true
        }
        
        return false
    }
    
    func contains(tuppleList: [Coordenate], coordenate: Coordenate) -> Bool {
        let (x, y) = coordenate
        for (i, j) in tuppleList {
            if x == i && y == j {
                return true
            }
        }
        
        return false
    }
    
    func boardExpansion(i: Int, j: Int) -> [Coordenate] {
        var coordenate : [Coordenate] = [Coordenate]()
        
        if i == 0 || i == lines - 1 {
            if i == 0 && validPosition(i: i + 1, j: j){
                matrix[i + 1] = replace(myString: matrix[i + 1], j, "👾")
                coordenate.append((i + 1, j))
            }else if i == lines - 1 && validPosition(i: i - 1, j: j) {
                matrix[i - 1] = replace(myString: matrix[i - 1], j, "👾")
                coordenate.append((i - 1, j))
            }
            
            if j - 1 >= 0 && validPosition(i: i, j: j - 1) {
                matrix[i] = replace(myString: matrix[i], j - 1, "👾")
                coordenate.append((i, j - 1))
            }
            
            if j + 1 <= rows - 1 && validPosition(i: i, j: j + 1) {
                matrix[i] = replace(myString: matrix[i], j + 1, "👾")
                coordenate.append((i, j + 1))
            }
        }
        
        if j == 0 || j == rows - 1 {
            if j == 0 && validPosition(i: i, j: j + 1){
                matrix[i] = replace(myString: matrix[i], j + 1, "👾")
                coordenate.append((i, j + 1))
            }else if j == rows - 1 && validPosition(i: i, j: j - 1) {
                matrix[i] = replace(myString: matrix[i], j - 1, "👾")
                coordenate.append((i, j - 1))
            }
            
            if i - 1 >= 0 && validPosition(i: i - 1, j: j) {
                matrix[i - 1] = replace(myString: matrix[i - 1], j, "👾")
                coordenate.append((i - 1, j))
            }
            
            
            if i + 1 <= lines - 1 && validPosition(i: i + 1, j: j) {
                matrix[i + 1] = replace(myString: matrix[i + 1], j, "👾")
                coordenate.append((i + 1, j))
            }
            
        }
        
        return coordenate
    }
    
    func middleTableExpansion(i: Int, j: Int) -> [Coordenate] {
        var coordenate : [Coordenate] = [Coordenate]()
    
        if validPosition(i: i + 1, j: j){
            matrix[i + 1] = replace(myString: matrix[i + 1], j, "👾")
            coordenate.append((i + 1, j))
        }
        
        if validPosition(i: i - 1, j: j) {
            matrix[i - 1] = replace(myString: matrix[i - 1], j, "👾")
            coordenate.append((i - 1, j))
        }
        
        if validPosition(i: i, j: j + 1){
            matrix[i] = replace(myString: matrix[i], j + 1, "👾")
            coordenate.append((i, j + 1))
        }
        
        if validPosition(i: i, j: j - 1) {
            matrix[i] = replace(myString: matrix[i], j - 1, "👾")
            coordenate.append((i, j - 1))
        }
        
        return coordenate
    }
    
    func bacteriumExpansion() {
        var bacteriumCreate : [Coordenate] = [Coordenate]() //lista de coordenadas que acabaram de ser expandidas e não poderão mais ser expandidas na mesma rodada. Antes de ocorrer a expansão, a coordenada da bactéria atual é buscada nessa lista. Se essa coordenada existir na lista, significa essa bactéria acabou de ser gerada e não poderá se expandir nessa rodada
        
        var coordinate : [Coordenate] = [Coordenate]() //lista de coordenadas auxiliar, que receberá uma lista de coordenadas dos métodos definidos e será adicionada à lista de coordenada principal "bacteriumCreate"
        
        for i in 0 ... lines - 1 {
            for j in 0 ... rows - 1 {
                if matrix[i][j] == "👾" && !contains(tuppleList: bacteriumCreate, coordenate: (i, j)) {
                    
                    if isBoard(i: i, j: j) {
                        coordinate = boardExpansion(i: i, j: j)
                    }else {
                        coordinate = middleTableExpansion(i: i, j: j)
                    }
                    
                    if !coordinate.isEmpty {
                        bacteriumCreate.append(contentsOf: coordinate)
                    }
                }
            }
        }
        
        getControlPointQuantity()
    }
    
    func printMatrix() {
        for i in 0 ... lines - 1 {
            for j in 0 ... rows - 1 {
                print(matrix[i][j], terminator: "")
            }
            print()
        }
    }
}

class ColoniaDeBacterias:Testable {
    
    func execute(matrix: [String]) -> Output? {

        let colonia = Colonia(matrix: Array(matrix))
        let initialControlPointsQuantity = colonia.controlPointQuantity
        var output1 = 0, output2 = 0, i = 1
        var primeiraIteracao = false
        
        print("lines = \(colonia.lines)")
        print("rows = \(colonia.rows)")
        print("number of controller points = \(colonia.controlPointQuantity)")
        print("number of bacterium  = \(colonia.bacteriumQuantity)")
        
        colonia.printMatrix()
        
        if(colonia.controlPointQuantity > 0 && colonia.bacteriumQuantity > 0) {
            while(colonia.controlPointQuantity != 0) {
                i += 1
                colonia.bacteriumExpansion()
                colonia.getControlPointQuantity()
                if initialControlPointsQuantity > colonia.controlPointQuantity && !primeiraIteracao {
                    output1 = i
                    primeiraIteracao = true
                }
                
                output2 = i
                
                print("control point = \(colonia.controlPointQuantity)")
                colonia.printMatrix()
            }
            
            print(output1, output2)

            return Output(output1, output2)
        }else{
            print("caiu em else")
            return nil
        }
    }
}

test(ColoniaDeBacterias())
