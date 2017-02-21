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

var myFunction: ((Int) -> Bool)
myFunction = divisibleBy5
let myNumber = 20
print("Is \(myNumber) divisible by 5: \(myFunction(myNumber))")
