// Book: Object-Oriented Programming with Swift 3
// Chapter 8: Extending and Building Object-Oriented Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

open class Point2D: CustomStringConvertible {
    open var x: Int
    open var y: Int
    
    open var valuesAsDescription: String {
        return "x: \(x), y: \(y)"
    }
    
    open var description: String {
        get {
            return "(\(valuesAsDescription))"
        }
    }
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

open class Point3D: Point2D {
    open var z: Int
    
    open override var valuesAsDescription: String {
        return "\(super.valuesAsDescription), z:\(z)"
    }
    
    init(x: Int, y: Int, z: Int) {
        self.z = z
        super.init(x: x, y: y)
    }
}

public extension Int {
    public func toPoint2D() -> Point2D {
        return Point2D(x: self, y: self)
    }
    
    public func toPoint3D() -> Point3D {
        return Point3D(x: self, y: self, z: self)
    }
}

print(3.toPoint2D())
print(5.toPoint2D())
print(3.toPoint3D())
print(5.toPoint3D())
