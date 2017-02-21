// Book: Object-Oriented Programming with Swift 3
// Chapter 4: Inheritance, Abstraction, and Specialization
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: The following code will produce build errors

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

// If we execute the following line in the Playground after declaring the Animal class, Swift will generate a fatal error and indicate that the printAChild type method must be overridden
Animal.printAChild()
