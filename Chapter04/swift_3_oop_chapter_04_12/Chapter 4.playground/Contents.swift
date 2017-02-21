// Book: Object-Oriented Programming with Swift 3
// Chapter 4: Inheritance, Abstraction, and Specialization
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

open class Animal {
    open class var numberOfLegs: Int {
        get {
            return 0;
            
        }
    }
    
    open class var averageNumberOfChildren: Int {
        get {
            return 0;
        }
    }
    
    open class var abilityToFly: Bool {
        get {
            return false;
        }
    }
    
    open var age: Int
    
    init(age : Int) {
        self.age = age
        print("Animal created")
    }
    
    open class func printALeg() {
        preconditionFailure("The pringALeg method must be overriden")
    }
    
    open func printLegs() {
        for _ in 0..<type(of: self).numberOfLegs {
            type(of: self).printALeg()
        }
        print(String())
        
    }
    
    open class func printAChild() {
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

open class Dog: DomesticMammal {
    open static override var numberOfLegs: Int {
        get {
            return 4;
        }
    }
    
    open static override var abilityToFly: Bool {
        get {
            return false;
        }
    }
    
    open var breed: String {
        get {
            return "Just a dog"
        }
    }
    
    open var breedFamily: String {
        get {
            return "Dog"
        }
    }
    
    private func initializeDog() {
        print("Dog created")
    }
    
    override init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age, name: name, favoriteToy: favoriteToy)
        initializeDog()
    }
    
    override init(age: Int, isPregnant: Bool, name: String, favoriteToy: String) {
        super.init(age: age, isPregnant: isPregnant, name: name, favoriteToy: favoriteToy)
        initializeDog()
    }
    
    public final func printBreed() {
        print(breed)
    }
    
    public final func printBreedFamily() {
        print(breedFamily)
    }
    
    open func printBark(times: Int, otherDomesticMammal: DomesticMammal?, isAngry: Bool) {
        var bark = "\(name)"
        if let unwrappedOtherDomesticMammal = otherDomesticMammal {
            bark += " to \(unwrappedOtherDomesticMammal.name): "
        } else {
            bark += ": "
        }
        if isAngry {
            bark += "Grr "
        }
        for _ in 0 ..< times {
            bark += "Woof "
        }
        print(bark)
    }
    
    open func bark() {
        printBark(times: 1, otherDomesticMammal: nil, isAngry: false)
    }
    
    open func bark(times: Int) {
        printBark(times: times, otherDomesticMammal: nil, isAngry: false)
    }
    
    open func bark(times: Int, otherDomesticMammal: DomesticMammal) {
        printBark(times: times, otherDomesticMammal: otherDomesticMammal, isAngry: false)
    }
    
    open func bark(times: Int, otherDomesticMammal: DomesticMammal, isAngry: Bool) {
        printBark(times: times, otherDomesticMammal: otherDomesticMammal, isAngry: isAngry)
    }
    
    open override func talk() {
        bark()
    }
}

open class TerrierDog: Dog {
    open override class var averageNumberOfChildren: Int {
        get {
            return 5;
        }
    }
    
    open override var breed: String {
        get {
            return "Terrier dog"
        }
    }
    
    open override var breedFamily: String {
        
        get {
            return "Terrier"
        }
    }
    
    private func initializeTerrierDog() {
        print("TerrierDog created")
    }
    
    override init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age, name: name, favoriteToy: favoriteToy)
        initializeTerrierDog()
    }
    
    override init(age: Int, isPregnant: Bool, name: String, favoriteToy: String) {
        super.init(age: age, isPregnant: isPregnant, name: name, favoriteToy: favoriteToy)
        initializeTerrierDog()
    }
    
    open override class func printALeg() {
        print("|", terminator: String())
    }
    
    open override class func printAChild() {
        // Print a dog's face emoji
        print(String(UnicodeScalar(0x01f436)!), terminator: String())
        
    }
}

open class SmoothFoxTerrier: TerrierDog {
    open override class var averageNumberOfChildren: Int {
        get {
            return 6;
        }
    }
    
    open override var breed: String {
        get {
            return "Smooth Fox Terrier dog"
        }
    }
    
    
    private func initializeSmoothFoxTerrier() {
        print("SmoothFoxTerrier created")
    }
    
    override init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age, name: name, favoriteToy: favoriteToy)
        initializeSmoothFoxTerrier()
    }
    
    override init(age: Int, isPregnant: Bool, name: String, favoriteToy: String) {
        super.init(age: age, isPregnant: isPregnant, name: name, favoriteToy: favoriteToy)
        initializeSmoothFoxTerrier()
    }
    
    open override class func printALeg() {
        print("!", terminator: String())
    }
    
    open override class func printAChild() {
        // Print Dog's face emoji
        print(String(UnicodeScalar(0x01f415)!), terminator: String())
    }
}

open class Cat: DomesticMammal {
    open static override var numberOfLegs: Int {
        get {
            return 4;
        }
    }
    
    open static override var abilityToFly: Bool {
        get {
            return false;
        }
    }
    
    open override class var averageNumberOfChildren: Int {
        get {
            return 6;
        }
    }
    
    private func initializeCat() {
        print("Cat created")
    }
    
    override init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age, name: name, favoriteToy: favoriteToy)
        initializeCat()
    }
    
    override init(age: Int, isPregnant: Bool, name: String, favoriteToy: String) {
        super.init(age: age, isPregnant: isPregnant, name: name, favoriteToy: favoriteToy)
        initializeCat()
    }
    
    open func printMeow(times: Int) {
        var meow = "\(name): "
        for _ in 0 ..< times {
            meow += "Meow "
        }
        print(meow)
    }
    
    open override func talk() {
        printMeow(times: 1)
    }
    
    open override class func printALeg() {
        print("*_*", terminator: String())
    }
    
    open override class func printAChild() {
        // Print grinning cat face with smiling eyes emoji
        print(String(UnicodeScalar(0x01F638)!), terminator: String())
    }
}

open class Bird: Animal {
    open var feathersColor: String = String()
    
    open static override var numberOfLegs: Int {
        get {
            return 2;
        }
    }
    
    private func initializeBird(feathersColor: String) {
        self.feathersColor = feathersColor
        print("Bird created")
    }
    
    override init(age: Int) {
        super.init(age: age)
        initializeBird(feathersColor: "Undefined / Too many colors")
    }
    
    init(age: Int, feathersColor: String) {
        super.init(age: age)
        initializeBird(feathersColor: feathersColor)
    }
}

open class DomesticBird: Bird {
    open var name = String()
    
    private func initializeDomesticBird(name: String) {
        self.name = name
        print("DomesticBird created")
    }
    
    init(age: Int, name: String) {
        super.init(age: age)
        initializeDomesticBird(name: name)
    }
    
    init(age: Int, feathersColor: String, name: String) {
        super.init(age: age, feathersColor: feathersColor)
        initializeDomesticBird(name: name)
    }
}

open class DomesticCanary: DomesticBird {
    open override class var averageNumberOfChildren: Int {
        get {
            return 5;
        }
    }
    
    private func initializeDomesticCanary() {
        print("DomesticCanary created")
    }
    
    override init(age: Int, name: String) {
        super.init(age: age, name: name)
        initializeDomesticCanary()
    }
    
    override init(age: Int, feathersColor: String, name: String) {
        super.init(age: age, feathersColor: feathersColor, name: name)
        initializeDomesticCanary()
    }
    
    open override class func printALeg() {
        print("^", terminator: String())
    }
    
    open override class func printAChild() {
        // Print bird emoji
        print(String(UnicodeScalar(0x01F426)!), terminator: String())
    }
}

public func printChildren(animal: Animal) {
    animal.printChildren()
}

public func printLegs(animal: Animal) {
    animal.printLegs()
}

var pluto = TerrierDog(age: 7, name: "Pluto", favoriteToy: "Teddy bear")
var marie = Cat(age: 4, isPregnant: true, name: "Marie", favoriteToy: "Tennis ball")
var tweety = DomesticCanary(age: 2, feathersColor: "Yellow", name: "Tweety")

print("Meet their children")
print(pluto.name)
printChildren(animal: pluto)
print(marie.name)
printChildren(animal: marie)
print(tweety.name)
printChildren(animal: tweety)

print("Look at their legs")
print(pluto.name)
printLegs(animal: pluto)
print(marie.name)
printLegs(animal: marie)
print(tweety.name)
printLegs(animal: tweety)

public func forceToTalk(domesticMammal: DomesticMammal) {
    domesticMammal.talk()
}

forceToTalk(domesticMammal: pluto)
forceToTalk(domesticMammal: marie)

public func < (left: Animal, right: Animal) -> Bool {
    return left.age < right.age
}

public func <= (left: Animal, right: Animal) -> Bool {
    return left.age <= right.age
}

public func > (left: Animal, right: Animal) -> Bool {
    return left.age > right.age
}

public func >= (left: Animal, right: Animal) -> Bool {
    return left.age >= right.age
}

print(pluto > marie)
print(pluto < marie)
print(pluto >= marie)
print(pluto <= marie)

public func += (left: Animal, right: Int) {
    left.age += right
}

pluto.printAge()
pluto += 2
pluto.printAge()

