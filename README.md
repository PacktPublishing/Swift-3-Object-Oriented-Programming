#Swift 3 Object Oriented Programming - Second Edition
This is the code repository for [Swift 3 Object Oriented Programming - Second Edition](https://www.packtpub.com/application-development/swift-3-object-oriented-programming-second-edition?utm_source=github&utm_medium=repository&utm_campaign=9781787120396), published by [Packt](https://www.packtpub.com/?utm_source=github). It contains all the supporting project files necessary to work through the book from start to finish.
## About the Book
Swift has quickly become one of the most-liked languages and developers’ de-facto choice when building applications that target iOS and macOS. In the new version, the Swift team wants to take its adoption to the next level by making it available for new platforms and audiences
##Instructions and Navigation
All of the code is organized into folders. Each folder starts with a number followed by the application name. For example, Chapter02.



The code will look like the following:
```
let bodyTemperature1 = HKQuantity(unit: degCUnit, doubleValue: 35.2)

let bodyTemperature2 = HKQuantity(unit: degFUnit, doubleValue: 95)


print(bodyTemperature1.description)

print(bodyTemperature2.description)


if bodyTemperature1.is(compatibleWith: degFUnit) {
   
   print("Temperature #1 in Fahrenheit degrees:     \(bodyTemperature1.doubleValue(for: degFUnit))")

}
```

In order to work with Xcode 8.x and the Swift Playground, you will need a Mac computer capable of running OS X 10.11.5 or later, with 8 GB RAM.

In order to work with Swift 3.x open source version in the Linux platform, you will need any computer capable of running Ubuntu 14.04 or later, or Ubuntu 15.10 or later. These are the Linux distributions where the Swift open source binaries have been built and tested. It it also possible to run the Swift compiler and utilities on other Linux distributions. You must check the latest available documentation at the Swift open source website: https://swift.org.

In order to work with the web-based IBM Swift Sandbox, you will need any device capable of executing a modern web browser.

##Related Products
* [Mastering Swift](https://www.packtpub.com/application-development/mastering-swift?utm_source=github&utm_medium=repository&utm_campaign=9781784392154)

* [Swift 3 Functional Programming](https://www.packtpub.com/application-development/swift-3-functional-programming?utm_source=github&utm_medium=repository&utm_campaign=9781785883880)

* [Mastering Swift 2](https://www.packtpub.com/application-development/mastering-swift-2?utm_source=github&utm_medium=repository&utm_campaign=9781785886034)

###Suggestions and Feedback
[Click here](https://docs.google.com/forms/d/e/1FAIpQLSe5qwunkGf6PUvzPirPDtuy1Du5Rlzew23UBp2S-P3wB-GcwQ/viewform) if you have any feedback or suggestions.
### Download a free PDF

 <i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no cost.<br>Simply click on the link to download a free PDF copy of this book.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781787120396">https://packt.link/free-ebook/9781787120396 </a> </p>