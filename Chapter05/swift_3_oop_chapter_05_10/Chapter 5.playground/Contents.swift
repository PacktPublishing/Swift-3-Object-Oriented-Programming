// Book: Object-Oriented Programming with Swift 3
// Chapter 5: Contract Programming with Protocols
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

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

open class AngryCat: ComicCharacter, GameCharacter {
    open var score: UInt = 0
    open var fullName: String = String()
    open var x: UInt = 0
    open var y: UInt = 0
    
    open var nickName: String = String()
    
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
    
    open func drawAt(x: UInt, y: UInt) {
        self.x = x
        self.y = y
        print("Drawing AngryCat \(fullName) at x: \(x), y: \(y)")
    }
    
    open func moveTo(x: UInt, y: UInt) {
        self.x = y
        self.y = y
        print("Moving AngryCat \(fullName) to x: \(x), y: \(y)")
    }
    
    open func intersects(character: GameCharacter) -> Bool {
        return ((x == character.x) && (y == character.y))
    }
    
    init (nickName: String, age: UInt, fullName: String, initialScore: UInt, x: UInt, y: UInt) {
        self.nickName = nickName
        self.age = age
        self.fullName = fullName
        self.score = initialScore
        self.x = x
        self.y = y
    }
}

open class AngryCatAlien : AngryCat, Alien {
    open var numberOfEyes: Int = 0
    
    init (nickName: String, age: UInt, fullName: String, initialScore: UInt, x: UInt, y: UInt, numberOfEyes: Int) {
        super.init(nickName: nickName, age: age, fullName: fullName, initialScore: initialScore, x: x, y: y)
        self.numberOfEyes = numberOfEyes
    }
    
    open func appear() {
        print("I'm \(fullName) and you can see my \(numberOfEyes) eyes.")
    }
    
    open func disappear() {
        print("\(fullName) disappears.")
    }
}

open class AngryCatWizard: AngryCat, Wizard {
    open var spellPower: Int = 0
    
    open func disappear(alien: Alien) {
        print("\(fullName) uses his \(spellPower) spell power to make the alien with \(alien.numberOfEyes) eyes disappear.")
    }
    
    init (nickName: String, age: UInt, fullName: String, initialScore: UInt, x: UInt, y: UInt, spellPower: Int) {
        super.init(nickName: nickName, age: age, fullName: fullName, initialScore: initialScore, x: x, y: y)
        self.spellPower = spellPower
    }
}

open class AngryCatKnight : AngryCat, Knight {
    open var swordPower: Int = 0
    open var swordWeight: Int = 0
    
    private func writeLinesAboutTheSword() {
        print("\(fullName) unsheaths his sword.")
        print("Sword power: \(swordPower). Sword weight: \(swordWeight).")
    }
    
    open func unsheathSword() {
        writeLinesAboutTheSword()
    }
    
    open func unsheathSword(target: Alien) {
        writeLinesAboutTheSword()
        print("The sword targets an alien with \(target.numberOfEyes) eyes.")
    }
    
    init (nickName: String, age: UInt, fullName: String, initialScore: UInt, x: UInt, y: UInt, swordPower: Int, swordWeight: Int) {
        super.init(nickName: nickName, age: age, fullName: fullName, initialScore: initialScore, x: x, y: y)
        self.swordPower = swordPower
        self.swordWeight = swordWeight
    }
}

var angryDog1 = AngryDog(nickName: "Bailey")
var angryCat1 = AngryCat(nickName: "Bella", age: 3, fullName: "Mrs. Bella", initialScore: 20, x: 10, y: 10)
var angryCatAlien1 = AngryCatAlien(nickName: "Lucy", age: 4, fullName: "Mrs. Lucy", initialScore: 50, x: 20, y: 10, numberOfEyes: 3)
var angryCatWizard1 = AngryCatWizard(nickName: "Daisy", age: 4, fullName: "Mrs. Daisy", initialScore: 50, x: 20, y: 10, spellPower: 6)
var angryCatKnight1 = AngryCatKnight(nickName: "Maggie", age: 3, fullName: "Mrs. Maggy", initialScore: 1300, x: 40, y: 10, swordPower: 7, swordWeight: 5)

print(angryDog1 is AngryDog)
print(angryDog1 is ComicCharacter)

print(angryCat1 is AngryCat)
print(angryCat1 is ComicCharacter)
print(angryCat1 is GameCharacter)

print(angryCatAlien1 is AngryCat)
print(angryCatAlien1 is AngryCatAlien)
print(angryCatAlien1 is ComicCharacter)
print(angryCatAlien1 is GameCharacter)
print(angryCatAlien1 is Alien)

print(angryCatWizard1 is AngryCat)
print(angryCatWizard1 is AngryCatWizard)
print(angryCatWizard1 is ComicCharacter)
print(angryCatWizard1 is GameCharacter)
print(angryCatWizard1 is Wizard)

print(angryCatKnight1 is AngryCat)
print(angryCatKnight1 is AngryCatKnight)
print(angryCatKnight1 is ComicCharacter)
print(angryCatKnight1 is GameCharacter)
print(angryCatKnight1 is Knight)

var brian = AngryDog(nickName: "Brian")
var merlin = AngryDog(nickName: "Merlin")
brian.drawSpeechBalloon(message: "Hello, my name is \(brian.nickName)")
brian.drawSpeechBalloon(destination: merlin, message: "How do you do?")
merlin.drawThoughtBalloon(message: "Who are you? I think.")

var garfield = AngryCat(nickName: "Garfield", age: 10, fullName: "Mr. Garfield", initialScore: 0, x: 10, y: 20)
garfield.drawSpeechBalloon(message: "Hello, my name is \(garfield.nickName)")
brian.drawSpeechBalloon(destination: garfield, message: "Hello \(garfield.nickName)")

var misterAlien = AngryCatAlien(nickName: "Alien", age: 120, fullName: "Mr. Alien", initialScore: 0, x: 10, y: 20, numberOfEyes: 3)
if (misterAlien.intersects(character: garfield)) {
    misterAlien.moveTo(x: garfield.x + 20, y: garfield.y + 20)
}
misterAlien.appear()

var gandalf = AngryCatWizard(nickName: "Gandalf", age: 75, fullName: "Mr. Gandalf", initialScore: 10000, x: 30, y: 40, spellPower: 100)
gandalf.drawAt(x: gandalf.x, y: gandalf.y)
gandalf.disappear(alien: misterAlien)
misterAlien.appear()

var camelot = AngryCatKnight(nickName: "Camelot", age: 35, fullName: "Sir Camelot", initialScore: 5000, x: 50, y: 50, swordPower: 100, swordWeight: 30)
camelot.drawAt(x: camelot.x, y: camelot.y)
camelot.unsheathSword(target: misterAlien)

misterAlien.drawThoughtBalloon(message: "I must be friendly or I'm dead...");
misterAlien.drawSpeechBalloon(destination: camelot, message: "Pleased to meet you, Sir.");

