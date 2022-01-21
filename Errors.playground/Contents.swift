import UIKit

enum PointerErrors: Error {
    case NullPointerError
}

enum GradeErrors: Error {
    case GradeTooHigh(description: String)
    case GradeTooLow(description: String)
    case InvalidGrade
}

enum ClassroomErrors: Error {
    case TooManyStudents
    case EmptyClass
    case StudentNotExists(description: String)
}

class Student {
    var name: String
    var grade: Double
    var id = UUID()
    
    init(name: String, grade: Double) {
        self.name = name
        self.grade = grade
        
    }
    
    func setGrade(grade: Double) throws {
        guard grade < 0 else {
            throw GradeErrors.GradeTooLow(description: "This grade is lesser than 0. It's invalid!")
        }
        
        guard grade > 10 else {
            throw GradeErrors.GradeTooHigh(description: "This grade is greater than 10. It's invalid!")
        }
        
        self.grade = grade
    }
    
    func getGrade() throws -> Double {
        if grade < 0 || grade > 10 {
            throw GradeErrors.InvalidGrade
        }
        return grade
    }
}

class Classroom {
    var students = Array<Student>()
    var classNumber = UUID()
    
    func addStudent(student: Student) throws {
        if students.count + 1 > 5 {
            throw ClassroomErrors.TooManyStudents
        }
        
        students.append(student)
    }
    
    func getStudent(name: String) throws -> UUID {
        for student in students {
            if student.name == name {
                return student.id
            }
        }
        
        throw ClassroomErrors.StudentNotExists(description: "The student \(name) is not here!")
    }
    
    func classAvarege() throws -> Double {
        var sum = 0.0
        for student in students {
            sum += try student.getGrade()
        }
        
        return sum / Double(students.count)
    }
}

func deferStatment() {
    print("function started")
    
    defer {
        print("defer statment")
    }
    
    print("function finished")
}

var students = Classroom()
do {
    try students.addStudent(student: Student(name: "estudante 1", grade: 5.7))
    try students.addStudent(student: Student(name: "estudante 2", grade: 8.2))
    try students.addStudent(student: Student(name: "estudante 3", grade: 5.7))
    try students.addStudent(student: Student(name: "estudante 4", grade: 11))
    try students.addStudent(student: Student(name: "estudante 5", grade: -1))
    try students.addStudent(student: Student(name: "estudante 6", grade: 10))
    
}catch ClassroomErrors.TooManyStudents {
    print("Too many students")
}

do {
    let average = try students.classAvarege()
    print("class average = \(average)")
} catch GradeErrors.InvalidGrade, GradeErrors.GradeTooHigh(description: "Too high"), GradeErrors.GradeTooLow(description: "Too low") {
    print("error treatment")
} catch _ {
    print("other error was founded!")
}

print("\(students.students.count)")

deferStatment()


print()
var studentFinded = try! students.getStudent(name: "estudante 3")
print("id = \(studentFinded)")

var studentFinded2 = try? students.getStudent(name: "estudante 9")
if let validStudent = studentFinded2 {
    print("id2 = \(validStudent)")
} else {
    print("estudante nao encotrado")
}
