// Book: Object-Oriented Programming with Swift 3
// Chapter 6: Maximization of Code Reuse with Generic Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

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

public func ==(left: Animal, right: Animal) -> Bool {
    return ((type(of: left) == type(of: left)) && (left.name == right.name))
}

open class Dog: Animal {
    open override var spelledSound1: String {
        get {
            return "Woof"
        }
    }
    
    open override var spelledSound2: String {
        get {
            return "Wooooof"
        }
    }
    
    open override var spelledSound3: String {
        get {
            return "Grr"
        }
    }
    
    open override var danceCharacters: String {
        get {
            return "/-\\ \\-\\ /-/"
        }
    }
}

open class Frog: Animal {
    open override var spelledSound1: String {
        get {
            return "Ribbit"
        }
    }
    
    open override var spelledSound2: String {
        get {
            return "Croak"
        }
    }
    
    open override var spelledSound3: String {
        get {
            return "Croooaaak"
        }
    }
    
    open override var danceCharacters: String {
        get {
            return "/|\\ \\|/ ^ ^ "
        }
    }
}

open class Lion: Animal {
    open override var spelledSound1: String {
        get {
            return "Roar"
        }
    }
    
    open override var spelledSound2: String {
        get {
            return "Rrroarrr"
        }
    }
    
    open override var spelledSound3: String {
        get {
            return "Rrrrrrroarrrrrr"
        }
    }
    
    open override var danceCharacters: String {
        get {
            return "*-* ** *|* ** "
        }
    }
}

public enum PartyError: Error {
    case insufficientMembersToRemoveLeader
    case insufficientMembersToVoteLeader
}

public protocol PartyProtocol {
    associatedtype MemberType
    
    init(leader: MemberType)
    
    func createAndAddMember(name: String) -> MemberType
    func add(member: MemberType)
    func remove(member: MemberType) throws -> MemberType?
    func dance()
    func sing()
    func voteLeader() throws
    subscript(index: UInt) -> MemberType? { get }
}

open class Party<AnimalElement: AnimalProtocol>: PartyProtocol where AnimalElement: Equatable {
    private var members = [AnimalElement]()
    
    open var leader: AnimalElement
    
    public required init(leader: AnimalElement) {
        self.leader = leader
        members.append(leader)
    }
    
    open subscript(index: UInt) -> AnimalElement? {
        get {
            if (index <= UInt(members.count - 1)) {
                return members[Int(index)]
            } else {
                return AnimalElement?.none
            }
        }
    }
    
    open func add(member: AnimalElement) {
        members.append(member)
        leader.sayWelcomeTo(destination: member)
    }
    
    open func remove(member: AnimalElement) throws -> AnimalElement? {
        if (member == leader) {
            throw PartyError.insufficientMembersToRemoveLeader
        }
        if let memberIndex = members.index(of: member) {
            let removedMember = members.remove(at: memberIndex)
            removedMember.sayGoodbyeTo(destination: leader)
            return removedMember
        } else {
            return AnimalElement?.none
        }
    }
    
    open func dance() {
        for (_, member) in members.enumerated() {
            member.dance()
        }
    }
    
    open func sing() {
        for (_, member) in members.enumerated() {
            member.sing()
        }
    }
    
    open func voteLeader() throws {
        if (members.count == 1) {
            throw PartyError.insufficientMembersToVoteLeader
        }
        
        var newLeader = leader
        while (newLeader == leader) {
            #if os(Linux)
                // The following line of code will only be executed if the underlying operating system is Linux
                // Only BSD-based operating systems provide arc4random_uniform in Swift
                // However, take into account that the lines aren't equivalent
                // We use this solution for this example only and to make it possible
                // to run the code in either the Swift web-based sandbox or Swift on Linux
                let randomLeaderIndex = Int(NSDate().timeIntervalSinceReferenceDate) % members.count
            #else
                // The following line runs on macOS, iOS, tvOS and watchOS
                let randomLeaderIndex = Int(arc4random_uniform(UInt32(members.count)))
            #endif
            newLeader = members[randomLeaderIndex]
        }
        
        leader.say(message: "\(newLeader.name) has been voted as our new party leader.")
        newLeader.dance()
        leader = newLeader
    }
    
    open func createAndAddMember(name: String) -> AnimalElement {
        let newMember = AnimalElement(name: name)
        add(member: newMember)
        
        return newMember
    }
}

var jake = Dog(name: "Jake")
var duke = Dog(name: "Duke")
var lady = Dog(name: "Lady")
var dakota = Dog(name: "Dakota")
var dogsParty = Party<Dog>(leader: jake)

dogsParty.add(member: duke)
dogsParty.add(member: lady)
dogsParty.add(member: dakota)

dogsParty.dance()
try dogsParty.remove(member: duke)
try dogsParty.voteLeader()
dogsParty.sing()

var coby = Dog(name: "Coby")
if let removedMember = try dogsParty.remove(member: coby) {
    print("\(removedMember.name) has been removed")
} else {
    print("\(coby.name) hasn't been removed")
}
if let removedMember = try dogsParty.remove(member: lady) {
    print("\(removedMember.name) has been removed")
} else {
    print("\(lady.name) hasn't been removed")
}

var frog1 = Frog(name: "Frog #1")
var frog2 = Frog(name: "Frog #2")
var frog3 = Frog(name: "Frog #3")
var frog4 = Frog(name: "Frog #4")
var frogsParty = Party<Frog>(leader: frog1)

frogsParty.add(member: frog2)
frogsParty.add(member: frog3)
frogsParty.add(member: frog4)

frogsParty.dance()
try frogsParty.remove(member: frog3)
try frogsParty.voteLeader()
frogsParty.sing()

var simba = Lion(name: "Simba")
var nala = Lion(name: "Nala")
var mufasa = Lion(name: "Mufasa")
var lionsParty = Party<Lion>(leader: simba)

lionsParty.add(member: nala)
lionsParty.add(member: mufasa)

lionsParty.sing()
lionsParty.dance()
try lionsParty.voteLeader()
try lionsParty.remove(member: nala)

let king = lionsParty.createAndAddMember(name: "King")
king.say(message: "My name is King")

if let lion = lionsParty[0] {
    print(lion.name)
}
if let lion = lionsParty[1] {
    print(lion.name)
}
if let lion = lionsParty[50] {
    print(lion.name)
} else {
    print("There is no lion with that index value")
}

public protocol DeeJayProtocol {
    var name: String { get }
    
    init(name: String)
    
    func playMusicToDance()
    func playMusicToSing()
}

open class HorseDeeJay: DeeJayProtocol {
    open let name: String
    
    public required init(name: String) {
        self.name = name
    }
    
    open func playMusicToDance() {
        print("My name is \(name). Let's Dance.")
        // Multiple musical notes emoji icon
        print(String(UnicodeScalar(0x01F3B6)!))
        // Dancer emoji icon
        print(String(UnicodeScalar(0x01F483)!))
    }
    
    open func playMusicToSing() {
        print("Time to sing!")
        // Guitar emoji icon
        print(String(UnicodeScalar(0x01F3B8)!))
    }
}

open class PartyWithDeeJay<AnimalElement: AnimalProtocol, DeeJayElement: DeeJayProtocol>: Party<AnimalElement> where AnimalElement: Equatable {
    public var deeJay: DeeJayElement
    
    init(leader: AnimalElement, deeJay: DeeJayElement) {
        self.deeJay = deeJay
        super.init(leader: leader)
    }
    
    public required init(leader: AnimalElement) {
        fatalError("init(leader:) has not been implemented")
    }
    
    open override func dance() {
        deeJay.playMusicToDance()
        super.dance()
    }
    
    open override func sing() {
        deeJay.playMusicToSing()
        super.sing()
    }
}

var silver = HorseDeeJay(name: "Silver")
var silverParty = PartyWithDeeJay<Dog, HorseDeeJay>(leader: jake, deeJay: silver)

silverParty.add(member: duke)
silverParty.add(member: lady)
silverParty.add(member: dakota)

silverParty.dance()
try silverParty.remove(member: duke)
try silverParty.voteLeader()
silverParty.sing()

var silverAndFrogsParty = PartyWithDeeJay<Frog, HorseDeeJay>(leader: frog1, deeJay: silver)

silverAndFrogsParty.add(member: frog2)
silverAndFrogsParty.add(member: frog3)

silverAndFrogsParty.dance()
silverAndFrogsParty.sing()

