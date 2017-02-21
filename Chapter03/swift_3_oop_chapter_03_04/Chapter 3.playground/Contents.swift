// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

import Foundation

class SuperHero {
    let name: String
    let birthYear: Int
    
    var age: Int {
        get {
            let date = Date()
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            
            return year - birthYear
        }
    }
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}

