// Book: Object-Oriented Programming with Swift 3
// Chapter 5: Contract Programming with Protocols
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

public protocol AnimalProtocol {
    static var numberOfLegs: Int { get }
    static var averageNumberOfChildren: Int { get }
    static var abilityToFly: Bool { get }
    
    var age: Int { get set }
    
    static func printALeg()
    static func printAChild()
    
    func printLegs()
    func printChildren()
    func printAge()
}

public protocol DomesticProtocol {
    var name: String { get set }
    var favoriteToy: String { get set }
    
    func talk()
}

public protocol MammalProtocol: AnimalProtocol {
    var isPregnant: Bool { get set }
}

public protocol DogProtocol: MammalProtocol {
    var breed: String { get }
    var breedFamily: String { get }
    
    func printBreed()
    func printBreedFamily()
    func bark()
    func bark(times: Int)
    func bark(times: Int, otherDomestic: DomesticProtocol)
    func bark(times: Int, otherDomestic: DomesticProtocol, isAngry: Bool)
    func printBark(times: Int, otherDomestic: DomesticProtocol?, isAngry: Bool)
}

public protocol CatProtocol: MammalProtocol {
    func printMeow(times: Int)
}

public protocol BirdProtocol: AnimalProtocol {
    var feathersColor: String { get set }
}

open class Animal: AnimalProtocol {
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
    
    public func printChildren() {
        for _ in 0..<type(of: self).averageNumberOfChildren {
            type(of: self).printAChild()
        }
        print(String())
    }
    
    public func printAge() {
        print("I am \(age) years old.")
    }
}

open class Mammal: Animal, MammalProtocol {
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

open class DomesticMammal: Mammal, DomesticProtocol {
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
    
    public func talk() {
        print("\(name): talks")
    }
}

open class Dog: DomesticMammal, DogProtocol {
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
    
    open func printBark(times: Int, otherDomestic: DomesticProtocol?, isAngry: Bool) {
        var bark = "\(name)"
        if let unwrappedOtherDomestic = otherDomestic {
            bark += " to \(unwrappedOtherDomestic.name): "
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
        printBark(times: 1, otherDomestic: nil, isAngry: false)
    }
    
    open func bark(times: Int) {
        printBark(times: times, otherDomestic: nil, isAngry: false)
    }
    
    open func bark(times: Int, otherDomestic: DomesticProtocol) {
        printBark(times: times, otherDomestic: otherDomestic, isAngry: false)
    }
    
    open func bark(times: Int, otherDomestic: DomesticProtocol, isAngry: Bool) {
        printBark(times: times, otherDomestic: otherDomestic, isAngry: isAngry)
    }
    
    open override func talk() {
        bark()
    }
}

open class Cat: DomesticMammal, CatProtocol {
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

open class Bird: Animal, BirdProtocol {
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

open class DomesticBird: Bird, DomesticProtocol {
    open var name = String()
    open var favoriteToy = String()
    
    private func initializeDomesticBird(name: String, favoriteToy: String) {
        self.name = name
        self.favoriteToy = favoriteToy
        print("DomesticBird created")
    }
    
    open func talk() {
        print("\(name): Tweet Tweet")
    }
    
    init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age)
        initializeDomesticBird(name: name, favoriteToy: favoriteToy)
    }
    
    init(age: Int, feathersColor: String, name: String, favoriteToy: String) {
        super.init(age: age, feathersColor: feathersColor)
        initializeDomesticBird(name: name, favoriteToy: favoriteToy)
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
    
    override init(age: Int, name: String, favoriteToy: String) {
        super.init(age: age, name: name, favoriteToy: favoriteToy)
        initializeDomesticCanary()
    }
    
    override init(age: Int, feathersColor: String, name: String, favoriteToy: String) {
        super.init(age: age, feathersColor: feathersColor, name: name, favoriteToy: favoriteToy)
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

var pluto = Dog(age: 7, name: "Pluto", favoriteToy: "Teddy bear")
var marie = Cat(age: 4, isPregnant: true, name: "Marie", favoriteToy: "Tennis ball")
var tweety = DomesticCanary(age: 2, feathersColor: "Yellow", name: "Tweety", favoriteToy: "Small bell")

tweety.talk()
pluto.bark(times: 3, otherDomestic: tweety)
marie.talk()
pluto.talk()

print(tweety is AnimalProtocol)
print(tweety is BirdProtocol)
print(tweety is DomesticProtocol)
print(tweety is Animal)
print(tweety is Bird)
print(tweety is DomesticBird)
print(tweety is DomesticCanary)
