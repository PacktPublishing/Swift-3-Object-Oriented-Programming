// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

import Foundation

class SuperHero {
    let name: String
    var birthYear: Int
    
    var age: Int {
        get {
            let date = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            
            return year - birthYear
        }
        set {
            let date = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            birthYear = year - newValue
        }
    }
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}

var antMan = SuperHero(name: "Ant-Man", birthYear: 1975)
print(antMan.age)
var ironMan = SuperHero(name: "Iron-Man", birthYear: 1982)
print(ironMan.age)

antMan.age = 32
print(antMan.age)
print(antMan.birthYear)

ironMan.age = 45
print(ironMan.age)
print(ironMan.birthYear)
 