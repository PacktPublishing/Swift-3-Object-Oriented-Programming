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

open class Party<AnimalElement: AnimalProtocol> where AnimalElement: Equatable {
    private var members = [AnimalElement]()
    
    open var leader: AnimalElement
    
    init(leader: AnimalElement) {
        self.leader = leader
        members.append(leader)
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

