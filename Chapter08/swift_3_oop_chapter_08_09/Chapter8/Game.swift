// Book: Object-Oriented Programming with Swift 3
// Chapter 8: Extending and Building Object-Oriented Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com
//
//  Game.swift

import Foundation

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
