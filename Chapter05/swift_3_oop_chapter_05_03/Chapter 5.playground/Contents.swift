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
    var nickName: String = String()
    
    func speak(message: String) {
        print("\(nickName) -> \"\(message)\"")
    }
    
    func think(message: String) {
        print("\(nickName) -> ***\(message)***")
    }
    
    func drawSpeechBalloon(message: String) {
        speak(message: message);
    }
    
    func drawSpeechBalloon(destination: ComicCharacter, message: String) {
        speak(message: "\(destination.nickName), \(message)")
    }
    
    func drawThoughtBalloon(message: String) {
        think(message: message)
    }
    
    init (nickName: String) {
        self.nickName = nickName
    }
}

