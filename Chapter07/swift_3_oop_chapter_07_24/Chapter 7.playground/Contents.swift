// Book: Object-Oriented Programming with Swift 3
// Chapter 7: Object-Oriented and Functional Programming
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

public func applyFunctionTo(numbers: [Int], condition: (Int) -> Bool) -> [Int] {
    var returnNumbers = [Int]()
    for number in numbers {
        if condition(number) {
            returnNumbers.append(number)
        }
    }
    
    return returnNumbers
}

func divisibleBy5(number: Int) -> Bool {
    return number % 5 == 0
}

var numbers = [10, 20, 30, 40, 50, 60, 63, 73, 43, 89]
var divisibleBy5Numbers = applyFunctionTo(numbers: numbers, condition: divisibleBy5)
print(divisibleBy5Numbers)

var myFunction = divisibleBy5
let myNumber = 20
print("Is \(myNumber) divisible by 5: \(myFunction(myNumber))")

open class NumbersWorker {
    private var numbers = [Int]()
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    open func appliedFunction(condition: (Int) -> Bool) -> [Int] {
        var returnNumbers = [Int]()
        for number in numbers {
            if condition(number) {
                returnNumbers.append(number)
            }
        }
        
        return returnNumbers
    }
    
    open func filteredBy(condition: (Int) -> Bool) -> [Int] {
        return numbersList.filter({ condition($0) })
    }
}

open class NumberFunctions {
    open static func isDivisibleBy5(number: Int) -> Bool {
        return number % 5 == 0
    }
}

var numbersList = [-60, -59, -48, -35, -25, -10, 11, 12, 13, 14, 15]
var worker = NumbersWorker(numbers: numbersList)
var divisibleBy5List = worker.appliedFunction(condition: NumberFunctions.isDivisibleBy5)
print(divisibleBy5List)

var filteredNumbers = numbersList.filter({
    (number: Int) -> Bool in
    return NumberFunctions.isDivisibleBy5(number: number)
})
print(filteredNumbers)

var numbersList2 = [-30, -29, -47, 10, 30, 50, 80]
var worker2 = NumbersWorker(numbers: numbersList)
var filteredNumbers2 = worker2.filteredBy(condition: NumberFunctions.isDivisibleBy5)
print(filteredNumbers2)

import Foundation

public protocol Identifiable {
    var id: Int { get }
}

open class Repository<Element: Identifiable> {
    open func getAll() -> [Element] {
        return [Element]()
    }
}

open class Entity: Identifiable {
    open let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

open class Game: Entity, CustomStringConvertible {
    open var name: String
    open var highestScore: Int
    open var playedCount: Int
    
    open var description: String {
        get {
            return "id: \(id), name: \"\(name)\", highestScore: \(highestScore), playedCount: \(playedCount)"
        }
    }
    
    init(id: Int, name: String, highestScore: Int, playedCount: Int) {
        self.name = name
        self.highestScore = highestScore
        self.playedCount = playedCount
        super.init(id: id)
    }
}

open class GameRepository: Repository<Game> {
    open override func getAll() -> [Game] {
        var gamesList = [Game]()
        
        gamesList.append(Game(id: 1, name: "Invaders 2017", highestScore: 1050, playedCount: 3_050))
        
        gamesList.append(Game(id: 2, name: "Minecraft", highestScore: 3741050, playedCount: 780_009_992))
        
        gamesList.append(Game(id: 3, name: "Minecraft Story Mode", highestScore: 67881050, playedCount: 304_506_506))
        
        gamesList.append(Game(id: 4, name: "Soccer Warriors", highestScore: 10_025, playedCount: 320_450))
        
        gamesList.append(Game(id: 5, name: "The Walking Dead Stories", highestScore: 1_450_708, playedCount: 75_405_350))
        
        gamesList.append(Game(id: 6, name: "Once Upon a Time in Wonderland", highestScore: 1_050_320, playedCount: 7_052))
        
        gamesList.append(Game(id: 7, name: "Cars Forever", highestScore: 6_705_203, playedCount: 850_021))
        
        gamesList.append(Game(id: 8, name: "Jake & Peter Pan", highestScore: 4_023_134, playedCount: 350_230))
        
        gamesList.append(Game(id: 9, name: "Kong Strikes Back", highestScore: 1_050_230, playedCount: 450_050))
        
        gamesList.append(Game(id: 10, name: "Mario Kart 2017", highestScore: 10_572_340, playedCount: 3_760_879))
        
        return gamesList
    }
    
    open func getWithHighestScoreGreaterThan(score: Int) -> [Game] {
        return getAll().filter({ $0.highestScore > score })
    }
    
    open func getWith(prefix: String) -> [Game] {
        return getAll().filter({ $0.name.hasPrefix(prefix) })
    }
    
    open func getBy(highestScore: Int, playedCount: Int) -> Game? {
        return getAll().filter({ $0.highestScore == highestScore && $0.playedCount == playedCount }).first
    }
    
    open func getUppercasedNames() -> [String] {
        return getAll().map( { $0.name.uppercased() })
    }
    
    open func getUppercasedAndLowercasedNames() -> [(upper: String, lower: String)] {
        return getAll().map({
            game -> (String, String) in
            (game.name.uppercased(), game.name.lowercased())
        })
    }
}

var gameRepository = GameRepository()
gameRepository.getAll().forEach({ (game) in print(game) })

gameRepository.getAll().forEach({ print($0) })

gameRepository.getWithHighestScoreGreaterThan(score: 5_000_000).forEach( { print($0) })

gameRepository.getWith(prefix: "Mi").forEach( { print($0) })

if let game0 = gameRepository.getBy(highestScore: 4023134, playedCount: 350230) {
    print(game0)
} else {
    print("No game found with the specified criteria")
}
if let game1 = gameRepository.getBy(highestScore: 30, playedCount: 40) {
    print(game1)
} else {
    print("No game found with the specified criteria")
}

gameRepository.getUppercasedNames().forEach( { print($0) })

gameRepository.getUppercasedAndLowercasedNames().forEach( { print($0.upper, " - ", $0.lower) })

gameRepository.getUppercasedAndLowercasedNames().forEach( { print($0.0, " - ", $0.1) })
