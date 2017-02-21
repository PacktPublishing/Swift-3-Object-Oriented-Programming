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

