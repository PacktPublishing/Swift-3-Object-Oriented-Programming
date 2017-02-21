// Book: Object-Oriented Programming with Swift 3
// Chapter 2: Structures, Classes, and Instances
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: This code sample  will display a build error
class Circle {
    var radius: Double
    init(radius: Double)
    {
        print("I'm initializing a new Circle instance with a radius value of \(radius).")
        self.radius = radius
    }
}

var circle1 = Circle(radius: 25)
var circle2 = Circle(radius: 50)

// The following line won't allow the Playground to compile the code and will display a build error because the compiler cannot find a parameterless initializer declared in the Circle class.
var circleError = Circle()
