// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

import Foundation

import Foundation

class SuperHero {
    let name: String
    var birthYear: Int
    
    var age: Int {
        get {
            return currentYear - birthYear
        }
        set {
            birthYear = currentYear - newValue
        }
    }
    
    var currentYear: Int {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        
        return year
    }
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}

var superBoy = SuperHero(name: "Super-Boy", birthYear: 2008)
print(superBoy.age)
var superGirl = SuperHero(name: "Super-Girl", birthYear: 2009)
print(superGirl.age)

superBoy.age = 9
print(superBoy.age)
print(superBoy.birthYear)

superGirl.age = 8
print(superGirl.age)
print(superGirl.birthYear)

print(superBoy.currentYear)
print(superGirl.currentYear)
