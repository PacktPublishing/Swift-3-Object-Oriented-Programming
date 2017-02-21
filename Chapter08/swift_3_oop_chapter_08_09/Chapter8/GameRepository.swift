// Book: Object-Oriented Programming with Swift 3
// Chapter 8: Extending and Building Object-Oriented Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com
//
//  GameRepository.swift

import Foundation

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
}








