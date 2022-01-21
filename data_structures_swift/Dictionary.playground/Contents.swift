import UIKit
/*Dictionary is a generic collection, composed by key and value.
 That data structure is */

var dictionaryExample : [String: Int] = ["Lucas": 0, "Eiki": 6, "Okada": 29]

/*Dictionary don't have any garantees of order. It's basically a hash table*/

dictionaryExample["Exemplo"] = 2 //create a new key-value to the dictionary

print(dictionaryExample)

/*Dictionary isn't ordered data structure. Because of that, the position that a new key-value will be inserted isn't garanteed*/

/*Insert and search in a dictionary is a O(1) complexety operation*/


