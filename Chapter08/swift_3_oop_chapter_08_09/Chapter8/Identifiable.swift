// Book: Object-Oriented Programming with Swift 3
// Chapter 8: Extending and Building Object-Oriented Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com
//
//  Identifiable.swift

import Foundation

public protocol Identifiable {
    var id: Int { get }
}
