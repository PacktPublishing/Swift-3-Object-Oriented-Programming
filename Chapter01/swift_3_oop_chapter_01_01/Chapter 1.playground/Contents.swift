// Book: Object-Oriented Programming with Swift 3
// Chapter 1: Objects from the Real-World to the Playground
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

import UIKit
import HealthKit

let degCUnit = HKUnit.degreeCelsius()
let degFUnit = HKUnit.degreeFahrenheit()

let degCUnitFromStr = HKUnit(from: "degC")
let degFUnitFromStr = HKUnit(from: "degF")

let kiloCaloriesUnit = HKUnit(from: "kcal")
let joulesUnit = HKUnit(from: "kJ")

let kiloGramsUnit = HKUnit.gramUnit(with: HKMetricPrefix.kilo)
let poundsUnit = HKUnit.pound()

let ouncesPerLiter = HKUnit(from: "oz/L")

let bodyTemperature1 = HKQuantity(unit: degCUnit, doubleValue: 35.2)
let bodyTemperature2 = HKQuantity(unit: degFUnit, doubleValue: 95)
print(bodyTemperature1.description)
print(bodyTemperature2.description)

if bodyTemperature1.is(compatibleWith: degFUnit) {
    print("Temperature #1 in Fahrenheit degrees: \(bodyTemperature1.doubleValue(for: degFUnit))")
}

if bodyTemperature2.is(compatibleWith: degFUnit) {
    print("Temperature #2 in Fahrenheit degrees: \(bodyTemperature2.doubleValue(for: degFUnit))")
}

let bodyTemperature2InDegC = HKQuantity(unit: degCUnit, doubleValue: bodyTemperature2.doubleValue(for: degCUnit))

let comparisonResult = bodyTemperature1.compare(bodyTemperature2)
switch comparisonResult {
case ComparisonResult.orderedDescending:
    print("Temperature #1 is greater than #2")
case ComparisonResult.orderedAscending:
    print("Temperature #2 is greater than #1")
case ComparisonResult.orderedSame:
    print("Temperature #1 is equal to Temperature #2")
}
