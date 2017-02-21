// Book: Object-Oriented Programming with Swift 3
// Chapter 6: Maximization of Code Reuse with Generic Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: The following code will produce build errors

import Foundation

public protocol AnimalProtocol {
    var name: String { get }
    
    init (name: String)
    
    func dance()
    func say(message: String)
    func sayGoodbyeTo(destination: AnimalProtocol)
    func sayWelcomeTo(destination: AnimalProtocol)
    func sing()
}

open class Animal: AnimalProtocol, Equatable {
    open let name: String
    
    open var danceCharacters: String {
        get {
            return String()
        }
    }
    
    open var spelledSound1: String {
        get {
            return String()
        }
    }
    
    open var spelledSound2: String {
        get {
            return String()
        }
    }
    
    open var spelledSound3: String {
        get {
            return String()
        }
    }
    
    public required init(name: String) {
        self.name = name
    }
    
    open func dance() {
        print("\(name) dances \(danceCharacters)")
    }
    
    open func say(message: String) {
        print("\(name) says: \(message)")
    }
    
    open func sayGoodbyeTo(destination: AnimalProtocol) {
        print("\(name) says goodbye to \(destination.name): \(spelledSound1) \(spelledSound2) \(spelledSound3)")
    }
    
    open func sayWelcomeTo(destination: AnimalProtocol) {
        print("\(name) welcomes \(destination.name): \(spelledSound2)")
    }
    
    open func sing() {
        let spelledSingSound = spelledSound1 + " ";
        let separator = ". "
        var song = "\(name) sings: "
        
        for _ in 1...3 {
            song += spelledSingSound
        }
        song += separator
        for _ in 1...2 {
            song += spelledSingSound
        }
        song += separator
        song += spelledSingSound
        song += separator
        
        print(song)
    }
}

/*public func ==(left: Animal, right: Animal) -> Bool {
    return ((type(of: left) == type(of: left)) && (left.name == right.name))
}*/

