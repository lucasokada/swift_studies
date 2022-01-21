import UIKit

protocol FloorPlan {
    var bedRoom: Int { get set }
    var utilityRoom: Int { get set }
    var bathRoom: Int { get set }
    var kitchen: Int { get set }
    var livingRoom: Int { get set }
}

struct HouseFloorPlan: FloorPlan {
    var bedRoom = 0
    var utilityRoom = 0
    var bathRoom = 0
    var kitchen: Int
    var livingRoom = 0
}

struct House {
    var stories = [FloorPlan]()
    
    mutating func addStory(floorPlan: FloorPlan) {
        stories.append(floorPlan)
    }
}

struct HouseProxy {
    var house = House()
    
    mutating func addStory(floorPlan: FloorPlan) -> Bool {
        if house.stories.count < 3 {
            house.addStory(floorPlan: floorPlan)
            return true
        }
        
        return false
    }
}

var ourHouse = HouseProxy()

var basement = HouseFloorPlan(bedRoom: 0, utilityRoom: 1, bathRoom: 1, kitchen: 0, livingRoom: 1)
var firstStory = HouseFloorPlan(bedRoom: 1, utilityRoom: 0, bathRoom: 2, kitchen: 1, livingRoom: 1)
var secondStory = HouseFloorPlan(bedRoom: 2, utilityRoom: 0, bathRoom: 1, kitchen: 0, livingRoom: 1)
var additionalStory = HouseFloorPlan(bedRoom: 1, utilityRoom: 0, bathRoom: 1, kitchen: 1, livingRoom: 1)

ourHouse.addStory(floorPlan: basement)
ourHouse.addStory(floorPlan: firstStory)
ourHouse.addStory(floorPlan: secondStory)
ourHouse.addStory(floorPlan: additionalStory)
