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

public extension Point3D {
    public func toTuple() -> (x: Int, y: Int, z: Int) {
        return (x: x, y: y, z: z)
    }
}

var point3D1 = Point3D(x: 10, y: 20, z: 15)
var point3D1Tuple = point3D1.toTuple()
print(point3D1Tuple)
let (point3D1x, point3D1y, point3D1z) = point3D1.toTuple()
print(point3D1x, point3D1y, point3D1z)
print(point3D1Tuple.x, point3D1Tuple.y, point3D1Tuple.z)
print(point3D1Tuple.0, point3D1Tuple.1, point3D1Tuple.2)

var r1InOhms = 500.0
var r2InKohms = 5.2
var r2InOhms = r2InKohms * 1e3
var r1PlusR2InOhms = r1InOhms + r2InOhms
