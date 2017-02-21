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
    
}
