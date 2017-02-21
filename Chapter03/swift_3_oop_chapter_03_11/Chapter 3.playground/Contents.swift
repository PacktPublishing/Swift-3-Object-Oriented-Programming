// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

import Foundation

import Foundation

import Foundation

public class SuperHero {
    public let name: String
    public var birthYear: Int
    
    private var sneakersField = "NOT SPECIFIED"
    
    public var sneakers: String {
        get {
            return sneakersField
        }
        set {
            sneakersField = newValue.localizedUppercase
        }
    }
    
    public var age: Int {
        get {
            return currentYear - birthYear
        }
        set {
            birthYear = currentYear - newValue
        }
    }
    
    public var currentYear: Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        return year
    }
    
    public var runningSpeedScore: Int {
        didSet {
            if (runningSpeedScore < 0) {
                runningSpeedScore = 0
            } else if (runningSpeedScore > 50) {
                runningSpeedScore = 50
            }
        }
    }
    
    init(name: String, birthYear: Int, sneakers: String, runningSpeedScore: Int) {
        self.name = name
        self.birthYear = birthYear
        self.runningSpeedScore = runningSpeedScore
        self.sneakers = sneakers
    }
}

var superBoy = SuperHero(name: "Super-Boy", birthYear: 2008, sneakers: "Running with Swift 3", runningSpeedScore: 5)
print(superBoy.runningSpeedScore)
superBoy.runningSpeedScore = -5
print(superBoy.runningSpeedScore)
superBoy.runningSpeedScore = 200
print(superBoy.runningSpeedScore)
superBoy.runningSpeedScore = 6
print(superBoy.runningSpeedScore)

// If we execute the following lines, the printed value will be 135, and the property will be initialized with an invalid value.
var superFlash = SuperHero(name: "Flash", birthYear: 1972, sneakers: "Flash running", runningSpeedScore: 135)
print(superFlash.runningSpeedScore)
