// Book: Object-Oriented Programming with Swift 3
// Chapter 5: Contract Programming with Protocols
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: The following code will produce build errors

public protocol ComicCharacter {
    var nickName: String { get set }
    
    func drawSpeechBalloon(message: String)
    func drawSpeechBalloon(destination: ComicCharacter, message: String)
    func drawThoughtBalloon(message: String)
}

public protocol GameCharacter {
    var fullName: String { get set }
    var score: UInt { get set }
    var x: UInt { get set }
    var y: UInt { get set }
    
    func drawAt(x: UInt, y: UInt)
    func moveTo(x: UInt, y: UInt)
    func intersects(character: GameCharacter) -> Bool
}

public protocol Alien {
    var numberOfEyes: Int { get set }
    
    func appear()
    func disappear()
}

public protocol Wizard {
    var spellPower: Int { get set }
    func disappear(alien: Alien)
}

public protocol Knight {
    var swordPower: Int { get set }
    var swordWeight: Int { get set }
    
    func unsheathSword()
    func unsheathSword(target: Alien)
}

open class AngryDog: ComicCharacter {
    open var nickName: String = String()
    
    fileprivate func speak(message: String) {
        print("\(nickName) -> \"\(message)\"")
    }
    
    fileprivate func think(message: String) {
        print("\(nickName) -> ***\(message)***")
    }
    
    open func drawSpeechBalloon(message: String) {
        speak(message: message);
    }
    
    open func drawSpeechBalloon(destination: ComicCharacter, message: String) {
        speak(message: "\(destination.nickName), \(message)")
    }
    
    open func drawThoughtBalloon(message: String) {
        think(message: message)
    }
    
    init (nickName: String) {
        self.nickName = nickName
    }
}

open class AngryCat: ComicCharacter {
    var nickName: String = String()
    
    open var age: UInt = 0
    
    open func drawSpeechBalloon(message: String) {
        if (age > 5) {
            print("\(nickName) -> \"Meow \(message)\"")
        } else {
            print("\(nickName) -> \"Meeeooow Meeeooow \(message)\"")
        }
    }
    
    open func drawSpeechBalloon(destination: ComicCharacter, message: String)
    {
        print("\(destination.nickName) === \(nickName) ---> \"\(message)\"")
    }
    
    open func drawThoughtBalloon(message: String) {
        print("\(nickName) thinks: \(message)")
    }
    
    init (nickName: String, age: UInt) {
        self.nickName = nickName
        self.age = age
    }
}
