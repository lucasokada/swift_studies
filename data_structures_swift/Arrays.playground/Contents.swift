import UIKit

var arrayPeople = ["Lucas", "Sonia", "Celso", "Cesar", "Clara"]
print("length = \(arrayPeople.count)")
print("capacity = \(arrayPeople.capacity)")
arrayPeople.append("Okada")
arrayPeople.append(contentsOf: ["Eiki", "Yugo", "Yassuo"])
print(arrayPeople)
arrayPeople.sort()
print("sort = \(arrayPeople)")
print(arrayPeople.description)
arrayPeople.insert("Teste String", at: 4)
print(arrayPeople)

print(arrayPeople[4])
