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
