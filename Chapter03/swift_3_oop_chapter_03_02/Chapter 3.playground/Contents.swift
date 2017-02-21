// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

class SuperHero {
    let name: String
    let birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
}

var antMan = SuperHero(name: "Ant-Man", birthYear: 1975)
print(antMan.name)
print(antMan.birthYear)
var ironMan = SuperHero(name: "Iron-Man", birthYear: 1982)
print(ironMan.name)
print(ironMan.birthYear)

