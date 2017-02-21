// Book: Object-Oriented Programming with Swift 3
// Chapter 3: Encapsulation of Data with Properties
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

public class ImmutableVector3D {
    public let x: Float
    public let y: Float
    public let z: Float
    
    init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public func summed(deltaX: Float, deltaY: Float, deltaZ: Float) -> ImmutableVector3D {
        return ImmutableVector3D(x: x + deltaX, y: y + deltaY, z: z + deltaZ)
    }
    
    public func printValues() {
        print("X: \(self.x), Y: \(self.y), Z: \(self.z))")
    }
    
    public class func makeEqualElements(initialValue: Float) -> ImmutableVector3D {
        return ImmutableVector3D(x: initialValue, y: initialValue, z: initialValue)
    }
    public class func makeOrigin() -> ImmutableVector3D {
        return makeEqualElements(initialValue: 0)
    }
}

var vector0 = ImmutableVector3D.makeOrigin()
var vector1 = vector0.summed(deltaX: 5, deltaY: 10, deltaZ: 15)
vector1.printValues()
