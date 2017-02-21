// Book: Object-Oriented Programming with Swift 3
// Chapter 7: Object-Oriented and Functional Programming
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

open class SphereAndCube {
    open static func renderSphere(
        x: Int, y: Int, z: Int, radius: Int,
        cameraX: Int, cameraY: Int, cameraZ: Int,
        cameraDirectionX: Int, cameraDirectionY: Int, cameraDirectionZ: Int,
        cameraVectorX: Int, cameraVectorY: Int, cameraVectorZ: Int,
        cameraPerspectiveFieldOfView: Int,
        cameraNearClippingPlane: Int,
        cameraFarClippingPlane: Int,
        directionalLightX: Int, directionalLightY: Int, directionalLightZ: Int,
        directionalLightColor: Int) {
        print("Creating camera at X:\(cameraX), Y:\(cameraY), Z:\(cameraZ)")
        print("Setting camera direction to X:\(cameraDirectionX), Y:\(cameraDirectionY), Z:\(cameraDirectionZ)")
        print("Setting camera vector to X:\(cameraVectorX), Y:\(cameraVectorY), Z:\(cameraVectorZ)")
        print("Setting camera perspective field of view to: \(cameraPerspectiveFieldOfView)")
        print("Setting camera near clipping plane to: \(cameraNearClippingPlane)")
        print("Setting camera far clipping plane to: \(cameraFarClippingPlane)")
        print("Creating directional light at X:\(directionalLightX), Y:\(directionalLightY), Z:\(directionalLightZ). Light color is \(directionalLightColor)")
        print("Drawing sphere at X:\(x), Y:\(y), Z:\(z)")
    }
    
    open static func renderCube(
        x: Int, y: Int, z: Int, edgeLength: Int,
        cameraX: Int, cameraY: Int, cameraZ: Int,
        cameraDirectionX: Int, cameraDirectionY: Int, cameraDirectionZ: Int,
        cameraVectorX: Int, cameraVectorY: Int, cameraVectorZ: Int,
        cameraPerspectiveFieldOfView: Int,
        cameraNearClippingPlane: Int,
        cameraFarClippingPlane: Int,
        directionalLightX: Int, directionalLightY: Int, directionalLightZ: Int,
        directionalLightColor: Int) {
        print("Creating camera at X:\(cameraX), Y:\(cameraY), Z:\(cameraZ)")
        print("Setting camera direction to X:\(cameraDirectionX), Y:\(cameraDirectionY), Z:\(cameraDirectionZ)")
        print("Setting camera vector to X:\(cameraVectorX), Y:\(cameraVectorY), Z:\(cameraVectorZ)")
        print("Setting camera perspective field of view to: \(cameraPerspectiveFieldOfView)")
        print("Setting camera near clipping plane to: \(cameraNearClippingPlane)")
        print("Setting camera far clipping plane to: \(cameraFarClippingPlane)")
        print("Creating directional light at X:\(directionalLightX), Y:\(directionalLightY), Z:\(directionalLightZ). Light color is \(directionalLightColor)")
        print("Drawing cube at X:\(x), Y:\(y), Z:\(z)")
    }
}

public protocol NumericForVector {
    init()
}

extension Int: NumericForVector { }

open class MutableVector3D<T: NumericForVector> {
    open var x: T
    open var y: T
    open var z: T
    
    init(x: T, y: T, z: T) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public var representation: String {
        get {
            return String("X: \(self.x), Y: \(self.y), Z: \(self.z)")
        }
    }
    
    open class func makeEqualElements(initialValue: T) -> MutableVector3D<T> {
        return MutableVector3D<T>(x: initialValue, y: initialValue, z: initialValue)
    }
    
    open class func makeOrigin() -> MutableVector3D<T> {
        let zero = T()
        return makeEqualElements(initialValue: zero)
    }
}

public protocol SceneElementProtocol {
    var location: MutableVector3D<Int> { get set }
}

open class SceneElement: SceneElementProtocol {
    open var location: MutableVector3D<Int>
    
    init(location: MutableVector3D<Int>) {
        self.location = location
    }
}

open class Light: SceneElement {
    
}

open class DirectionalLight: Light
{
    open var color: Int
    
    init(location: MutableVector3D<Int>, color: Int) {
        self.color = color
        super.init(location: location)
    }
}

open class Camera: SceneElement {
    
}

open class PerspectiveCamera: Camera {
    open var direction: MutableVector3D<Int>
    open var vector: MutableVector3D<Int>
    open var fieldOfView: Int
    open var nearClippingPlane: Int
    open var farClippingPlane: Int
    
    init(location: MutableVector3D<Int>, direction: MutableVector3D<Int>, vector: MutableVector3D<Int>, fieldOfView: Int, nearClippingPlane: Int, farClippingPlane: Int) {
        self.direction = direction
        self.vector = vector
        self.fieldOfView = fieldOfView
        self.nearClippingPlane = nearClippingPlane
        self.farClippingPlane = farClippingPlane
        super.init(location: location)
    }
}

open class Shape: SceneElement
{
    open func render(camera: Camera, lights: [Light]) {
        
    }
}

open class Sphere: Shape {
    open var radius: Int
    
    init(location: MutableVector3D<Int>, radius: Int) {
        self.radius = radius
        super.init(location: location)
    }
    
    open override func render(camera: Camera, lights: [Light]) {
        print("Drawing sphere at \(location.representation)")
    }
}

open class Cube: Shape {
    open var edgeLength: Int
    
    init(location: MutableVector3D<Int>, edgeLength: Int) {
        self.edgeLength = edgeLength
        super.init(location: location)
    }
    
    open override func render(camera: Camera, lights: [Light]) {
        print("Drawing cube at \(location.representation)")
    }
}

open class Scene {
    private var lights = [Light]()
    private var shapes = [Shape]()
    private var activeCamera: Camera
    
    init(initialCamera: Camera) {
        activeCamera = initialCamera
    }
    
    open func add(light: Light) {
        lights.append(light)
    }
    
    open func add(shape: Shape) {
        shapes.append(shape)
    }
    
    open func render() {
        print("Creating camera at \(activeCamera.location.representation)")
        if let perspectiveCamera = activeCamera as? PerspectiveCamera {
            print("Setting camera direction to \(perspectiveCamera.direction.representation)")
            print("Setting camera vector to \(perspectiveCamera.vector.representation)")
            print("Setting camera perspective field of view to: \(perspectiveCamera.fieldOfView)")
            print("Setting camera near clipping plane to: \(perspectiveCamera.nearClippingPlane)")
            print("Setting camera far clipping plane to: \(perspectiveCamera.farClippingPlane)")
        }
        for light in lights {
            if let directionalLight = light as? DirectionalLight {
                print("Creating directional light at \(directionalLight.location.representation). Light color is \(directionalLight.color)")
            } else {
                print("Creating light at \(light.location.representation)")
            }
        }
        
        for shape in shapes {
            shape.render(camera: activeCamera, lights: lights)
        }
    }
}

var camera = PerspectiveCamera(location: MutableVector3D<Int>.makeEqualElements(initialValue: 30),
                               direction: MutableVector3D<Int>(x: 50, y: 0, z: 0),
                               vector: MutableVector3D<Int>(x: 4, y: 5, z: 2),
                               fieldOfView: 90,
                               nearClippingPlane: 20,
                               farClippingPlane: 40)
var sphere = Sphere(location: MutableVector3D<Int>(x: 20, y: 20, z: 20), radius: 8)
var cube = Cube(location: MutableVector3D<Int>.makeEqualElements(initialValue: 10), edgeLength: 5)
var light = DirectionalLight(location: MutableVector3D<Int>(x: 2, y: 2, z: 5), color: 235)

var scene = Scene(initialCamera: camera)
scene.add(shape: sphere)
scene.add(shape: cube)
scene.add(light: light)

scene.render()

SphereAndCube.renderCube(x: 10, y: 20, z: 30, edgeLength: 50, cameraX: 25, cameraY: 25, cameraZ: 70, cameraDirectionX: 30, cameraDirectionY: 20, cameraDirectionZ: 35, cameraVectorX: 11, cameraVectorY: 15, cameraVectorZ: 25, cameraPerspectiveFieldOfView: 140, cameraNearClippingPlane: 150, cameraFarClippingPlane: 160, directionalLightX: 30, directionalLightY: 30, directionalLightZ: 25, directionalLightColor: 156)

SphereAndCube.renderSphere(x: 10, y: 15, z: 25, radius: 32, cameraX: 25, cameraY: 35, cameraZ: 10, cameraDirectionX: 30, cameraDirectionY: 35, cameraDirectionZ: 10, cameraVectorX: 62, cameraVectorY: 5, cameraVectorZ: 2, cameraPerspectiveFieldOfView: 7, cameraNearClippingPlane: 20, cameraFarClippingPlane: 30, directionalLightX: 5, directionalLightY: 4, directionalLightZ: 7, directionalLightColor: 232)
