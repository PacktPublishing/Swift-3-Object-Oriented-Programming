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

// The following line produces a wrong result
var r3InOhms = r1InOhms + r2InKohms

public extension Double {
    public var ohm: Double { return self }
    public var kohm: Double { return self * 1e3 }
    public var mohm: Double { return self * 1e6 }
}

var resistance1 = 500.0.ohm
var resistance2 = 5.2.kohm
var resistance3 = 3.1.mohm
print("resistance1 in ohms: \(resistance1)")
print("resistance2 in ohms: \(resistance2)")
print("resistance3 in ohms: \(resistance3)")

var totalResistance = resistance1 + resistance2 + resistance3

print("Total resistance in ohms: \(totalResistance)")

public extension Double {
    public var Ω: Double { return self }
    public var KΩ: Double { return self * 1e3 }
    public var MΩ: Double { return self * 1e6 }
}

var resistance4 = 500.0.Ω
var resistance5 = 5.2.KΩ
var resistance6 = 3.1.MΩ
print("resistance4 in Ω: \(resistance4)")
print("resistance5 in Ω: \(resistance5)")
print("resistance6 in Ω: \(resistance6)")

var totalResistance456 = resistance4 + resistance5 + resistance6

print("Total resistance in Ω: \(totalResistance456)")

public extension Point3D {
    convenience init(tuple: (Int, Int, Int)) {
        self.init(x: tuple.0, y: tuple.1, z: tuple.2)
    }
    
    convenience init(singleValue: Int) {
        self.init(x: singleValue, y: singleValue, z: singleValue)
    }
    
    convenience init(point2D: Point2D, z: Int) {
        self.init(x: point2D.x, y: point2D.y, z: z)
    }
}

var tuple1 = (10, 20, 30)
var tuple2 = (5, 10, 15)

var point3D3 = Point3D(tuple: tuple1)
var point3D4 = Point3D(tuple: tuple2)
print(point3D3)
print(point3D4)

var point3D5 = Point3D(singleValue: 5)
print(point3D5)

var point2D6 = Point2D(x: 10, y: 11)
var point3D6 = Point3D(point2D: point2D6, z: 12)
print(point3D6)

public extension Point3D {
    public subscript(index: Int) -> Int? {
        switch index {
        case 0: return x
        case 1: return y
        case 2: return z
        default: return nil
        }
    }
}

var point3D7 = Point3D(x: 10, y: 15, z: 4)
if let point3D7X = point3D7[0] {
    print("X or [0]: \(point3D7X)")
}
if let point3D7Y = point3D7[1] {
    print("Y or [1]: \(point3D7Y)")
}
if let point3D7Z = point3D7[2] {
    print("Z or [2]: \(point3D7Z)")
}

