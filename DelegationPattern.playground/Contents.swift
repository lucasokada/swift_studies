import UIKit

protocol AdvancedLifeSupport {
    func performCPR();
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compression. 30 per second")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compression. 30 per second")
    }
    
    func useStethescope() {
        print("Listening heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        print("The surgeon does chest compression. 30 per second")
    }
    
    func useEletricDrill() {
        print("Whirrrrr..")
    }
}

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)
let lucas = Doctor(handler: emilio)


emilio.assessSituation()
emilio.medicalEmergency()
