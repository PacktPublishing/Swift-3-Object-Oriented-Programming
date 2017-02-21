// Book: Object-Oriented Programming with Swift 3
// Chapter 4: Inheritance, Abstraction, and Specialization
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

open class Animal {
    open static var numberOfLegs: Int {
        get {
            return 0;
            
        }
    }
    open static var averageNumberOfChildren: Int {
        get {
            return 0;
        }
    }
    
    open static var abilityToFly: Bool {
        get {
            return false;
        }
    }
    
    open var age: Int
    
    init(age : Int) {
        self.age = age
        print("Animal created")
    }
    
    open static func printALeg() {
        preconditionFailure("The pringALeg method must be overriden")
    }
    
    open func printLegs() {
        for _ in 0..<type(of: self).numberOfLegs {
            type(of: self).printALeg()
        }
        print(String())
        
    }
    
    open static func printAChild() {
        preconditionFailure("The printChild method must be overriden")
    }
    
    open func printChildren() {
        for _ in 0..<type(of: self).averageNumberOfChildren {
            type(of: self).printAChild()
        }
        print(String())
    }
    
    open func printAge() {
        print("I am \(age) years old.")
    }
}

open class Mammal: Animal {
    open var isPregnant: Bool = false
    
    private func initialize(isPregnant: Bool) {
        self.isPregnant = isPregnant
        print("Mammal created")
    }
    
    override init(age: Int) {
        super.init(age: age)
        initialize(isPregnant: false)
    }
    
    init(age: Int, isPregnant: Bool) {
        super.init(age: age)
        initialize(isPregnant: isPregnant)
    }
}

open class DomesticMammal: Mammal {
    open var name = String()
    open var favoriteToy = String()
    
    private func initialize(name: String, favoriteToy: String) {
        self.name = name
        self.favoriteToy = favoriteToy
        print("DomesticMammal created")
    }
    
    init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age)
        initialize(name: name, favoriteToy: favoriteToy)
    }
    
    init(age: Int, isPregnant: Bool, name: String, favoriteToy: String) {
        super.init(age: age, isPregnant: isPregnant)
        initialize(name: name, favoriteToy: favoriteToy)
    }
    
    open func talk() {
        print("\(name): talks")
    }
}

var scooby = DomesticMammal(age: 5, name: "Scooby", favoriteToy: "Scarf")
scooby.printAge()
scooby.talk()
print(scooby.favoriteToy)
print(scooby.isPregnant)

var lady = DomesticMammal(age: 6, isPregnant: true, name: "Lady", favoriteToy: "Teddy")
lady.printAge()
lady.talk()
print(lady.favoriteToy)
print(lady.isPregnant)

