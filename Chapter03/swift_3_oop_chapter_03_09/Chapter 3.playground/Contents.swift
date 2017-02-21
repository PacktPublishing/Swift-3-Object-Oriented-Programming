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
        willSet {
            print("The current value for running speed score is:\(runningSpeedScore)")
            print("I will set the new value for running speed score to: \(newValue)")
        }
        didSet {
            print("I have set the new value for running speed score to: \(runningSpeedScore)")
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
print(superBoy.sneakers)
superBoy.runningSpeedScore = 7
