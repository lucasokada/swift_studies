import UIKit

struct PessoaStruct {
    var name: String
    var idade: Int
    var cpf: String
}

class PessoaClass {
    var name: String
    var idade: Int
    var cpf: String
    
    init(name: String, idade: Int, cpf: String) {
        self.name = name
        self.idade = idade
        self.cpf = cpf
    }
}

var pessoa1 = PessoaClass(name: "Lucas", idade: 21, cpf: "xxx.xxx.xxx-xx") //tipo referencia
var pessoa2 = PessoaStruct(name: "Lucas", idade: 21, cpf: "xxx.xxx.xxx-xx") //tipo dado

var pessoa3 = pessoa1   //passa a referência
pessoa3.name = "Zezinho"
print("pessoa1.nome = \(pessoa1.name). pessoa3.name = \(pessoa3.name)")

var pessoa4 = pessoa2 //passa cópia
pessoa4.name = "Joao"
print("pessoa2.name = \(pessoa2.name). pessoa4.name = \(pessoa4.name)")

//-------------------proriedades-------------------

struct MyStruct {
    var salaryYear: Double  //propriedade armazenada
    var salaryWeek: Double {  //propriedade computada -> calculada toda vez que é chamada
        get {
            self.salaryYear / 52
        }
        
        set(newSalaryWeek) {
            self.salaryWeek = newSalaryWeek
            self.salaryYear = self.salaryWeek * 52
        }
    }
}

class MyClass {
    var salaryYear: Double  //propriedade armazenada
    var salaryWeek: Double {  //propriedade computada -> calculada toda vez que é chamada
        get {
            self.salaryYear / 52
        }
        
        set(newSalaryWeek) {
            self.salaryWeek = newSalaryWeek
            self.salaryYear = self.salaryWeek * 52
        }
    }
    
    init(salaryYear: Double) {
        self.salaryYear = salaryYear
    }
}

var myClass = MyClass(salaryYear: 14_400)
var myStruct = MyStruct(salaryYear: 14_400)

print("class: salaryYear = \(myClass.salaryYear), salaryWeek = \(myClass.salaryWeek)")
print("struct: salaryYear = \(myStruct.salaryYear)), salaryWeek = \(myStruct.salaryWeek)")

myClass.salaryWeek = 500.00
//myStruct.salaryWeek = 700.00

print("class: salaryYear = \(myClass.salaryYear), salaryWeek = \(myClass.salaryWeek)")
//print("struct: salaryYear = \(myStruct.salaryYear)), salaryWeek = \(myStruct.salaryWeek)")
