// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: The following code will generate build errors
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

// The two lines of code try to assign a new value to the properties and fail to do so because they are immutable properties
antMan.name = "Batman"
antMan.birthYear = 1976
