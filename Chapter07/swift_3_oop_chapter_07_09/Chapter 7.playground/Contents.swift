// Book: Object-Oriented Programming with Swift 3
// Chapter 7: Object-Oriented and Functional Programming
// Author: Gaston C. Hillar - Twitter.com/gastonhillar
// Publisher: Packt Publishing Ltd. - http://www.packtpub.com

public func applyFunctionTo(numbers: [Int], condition: (Int) -> Bool) -> [Int] {
    var returnNumbers = [Int]()
    for number in numbers {
        if condition(number) {
            returnNumbers.append(number)
        }
    }
    
    return returnNumbers
}

func divisibleBy5(number: Int) -> Bool {
    return number % 5 == 0
}

var numbers = [10, 20, 30, 40, 50, 60, 63, 73, 43, 89]
var divisibleBy5Numbers = applyFunctionTo(numbers: numbers, condition: divisibleBy5)
print(divisibleBy5Numbers)

var myFunction = divisibleBy5
let myNumber = 20
print("Is \(myNumber) divisible by 5: \(myFunction(myNumber))")

open class NumbersWorker {
    private var numbers = [Int]()
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    open func appliedFunction(condition: (Int) -> Bool) -> [Int] {
        var returnNumbers = [Int]()
        for number in numbers {
            if condition(number) {
                returnNumbers.append(number)
            }
        }
        
        return returnNumbers
    }
    
    open func filteredBy(condition: (Int) -> Bool) -> [Int] {
        return numbersList.filter({
            (number: Int) -> Bool in
            return condition(number)
        })
    }
}

open class NumberFunctions {
    open static func isDivisibleBy5(number: Int) -> Bool {
        return number % 5 == 0
    }
}

var numbersList = [-60, -59, -48, -35, -25, -10, 11, 12, 13, 14, 15]
var worker = NumbersWorker(numbers: numbersList)
var divisibleBy5List = worker.appliedFunction(condition: NumberFunctions.isDivisibleBy5)
print(divisibleBy5List)

var filteredNumbers = numbersList.filter({
    (number: Int) -> Bool in
    return NumberFunctions.isDivisibleBy5(number: number)
})
print(filteredNumbers)

var numbersList2 = [-30, -29, -47, 10, 30, 50, 80]
var worker2 = NumbersWorker(numbers: numbersList)
var filteredNumbers2 = worker2.filteredBy(condition: NumberFunctions.isDivisibleBy5)
print(filteredNumbers2)

