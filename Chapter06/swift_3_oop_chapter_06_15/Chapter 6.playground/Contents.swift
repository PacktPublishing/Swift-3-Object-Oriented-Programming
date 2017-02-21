// Book: Object-Oriented Programming with Swift 3
// Chapter 6: Maximization of Code Reuse with Generic Code
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

// Warning: The following code will produce build errors

open class MutableVector3D<T: SignedNumber> {
    open var x: T
    open var y: T
    open var z: T
    
    init(x: T, y: T, z: T) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    open func sum(deltaX: T, deltaY: T, deltaZ: T) {
        x += deltaX
        y += deltaY
        z += deltaZ
    }
    
    open func printValues() {
        print("X: \(self.x), Y: \(self.y), Z: \(self.z)")
    }
}

open class ImmutableVector3D<T: SignedNumber> {
    open let x: T
    open let y: T
    open let z: T
    
    init(x: T, y: T, z: T) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    open func summed(deltaX: T, deltaY: T, deltaZ: T) -> ImmutableVector3D<T> {
        return ImmutableVector3D<T>(x: x + deltaX, y: y + deltaY, z: z + deltaZ)
    }
    
    open func printValues() {
        print("X: \(self.x), Y: \(self.y), Z: \(self.z)")
    }
    
    open class func makeEqualElements(initialValue: T) -> ImmutableVector3D<T> {
        return ImmutableVector3D<T>(x: initialValue, y: initialValue, z: initialValue)
    }
    
    open class func makeOrigin() -> ImmutableVector3D<T> {
        return makeEqualElements(initialValue: 0)
    }
}

let mutableVector0 = MutableVector3D<Double>(x: 10.1, y: 10.2, z: 10.3)
mutableVector0.sum(deltaX: 3.4, deltaY: 4.52, deltaZ: 3.32)
mutableVector0.printValues()

let mutableVector1 = MutableVector3D<Float>(x: 3.456, y: 9.231, z: 3.324)
mutableVector1.sum(deltaX: 3.411, deltaY: 4.232, deltaZ: 3.465)
mutableVector1.printValues()

let mutableVector2 = MutableVector3D<Float80>(x: 7.2345, y: 2.3489, z: 1.3485)
mutableVector2.sum(deltaX: 3.4113, deltaY: 1.2332, deltaZ: 1.3482)
mutableVector2.printValues()

let immutableVector0 = ImmutableVector3D<Double>(x: 10.1, y: 10.2, z: 10.3)
let immutableVector1 = immutableVector0.summed(deltaX: 3.4, deltaY: 4.52, deltaZ: 3.32)
immutableVector1.printValues()

let immutableVector2 = ImmutableVector3D<Float>(x: 3.456, y: 9.231, z: 3.324)
let immutableVector3 = immutableVector2.summed(deltaX: 3.411, deltaY: 4.232, deltaZ: 3.465)
immutableVector3.printValues()

let immutableVector4 = ImmutableVector3D<Float80>(x: 7.2345, y: 2.3489, z: 1.3485)
let immutableVector5 = immutableVector4.summed(deltaX: 3.4113, deltaY: 1.2332, deltaZ: 1.3482)
immutableVector5.printValues()
