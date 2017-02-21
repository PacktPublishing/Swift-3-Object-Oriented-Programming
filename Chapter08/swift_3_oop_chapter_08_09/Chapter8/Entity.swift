// Book: Object-Oriented Programming with Swift 3
// Chapter 8: Extending and Building Object-Oriented Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com
//
//  Entity.swift

import Foundation

open class Entity: Identifiable {
    open let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
