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
    
    private var runningSpeedScoreField: Int = 0
    public var runningSpeedScore: Int {
        get {
            return runningSpeedScoreField
        }
        set {
            if (newValue < 0) {
                runningSpeedScoreField = 0
            } else if (newValue > 50) {
                runningSpeedScoreField = 50
            } else {
                runningSpeedScoreField = newValue
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

var superFlash = SuperHero(name: "Flash", birthYear: 1972, sneakers: "Flash running", runningSpeedScore: 135)
print(superFlash.runningSpeedScore)
