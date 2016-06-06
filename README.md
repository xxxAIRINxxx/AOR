# AOR

[![Swift 2.2](https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![Xcode 7.3+](https://img.shields.io/badge/Xcode-7.3+-blue.svg?style=flat)](https://developer.apple.com/swift/)

![screen_shot](Images/screen_shot.png "")

Wrapper of NSAttributedString and Text Kit. written in Swift.

## Exsample

### Basics

![basics](Images/basics.png "")

### Multiple Attributes

![multiple](Images/multiple.png "")

### Adding Attributes

![adding](Images/adding.png "")

### Adding Attributes (Custom Operator)

![adding_operator](Images/adding_operator.png "")

### Paragraph

![paragraph](Images/paragraph.png "")

### Text Kit Support

#### Line Count

```swift
AOR("any....").lineCount(self.textView.size) // -> Int
```

#### Line of Rect

```swift
AOR("any....").lineRects(self.textView.size) // -> [CGRect]
```

#### Line of Range

```swift
AOR("any....").lineRanges(self.textView.size) // -> [NSRange]
```

#### Line of String

```swift
AOR("any....").lineStrings(self.textView.size) // -> [String]


AOR("any....").lineAttributedStrings(self.textView.size) // -> [NSAttributedString]
```

## Requirements

* iOS 8.0+
* Swift 2.2
* Xcode 7.3+

## Installation

### CocoaPods

AOR is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
use_frameworks!

pod "AOR"
```

### Carthage

To integrate AOR into your Xcode project using Carthage, specify it in your Cartfile:

```ruby
github "xxxAIRINxxx/AOR"
```

## License

MIT license. See the LICENSE file for more info.
