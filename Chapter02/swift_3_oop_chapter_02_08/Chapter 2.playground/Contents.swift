// Book: Object-Oriented Programming with Swift 3
// Chapter 2: Structures, Classes, and Instances
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

class Circle {
    var radius: Double
    init(radius: Double)
    {
        print("I'm initializing a new Circle instance with a radius value of \(radius).")
        self.radius = radius
    }
    
    deinit {
        print("I'm destroying the Circle instance with a radius value of \(radius).")
    }
    
}

var circle3 = Circle(radius: 42)
var referenceToCircle3 = circle3
circle3 = Circle(radius: 84)
