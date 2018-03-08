# SwiftDebouncer
Swift Debouncer library

[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/SwiftDebouncer/badge.png)](https://cocoadocs.org/docsets/SwiftDebouncer)
[![Language](https://img.shields.io/badge/language-swift%204-1b7cb9.svg)](https://img.shields.io/badge/language-swift%204-1b7cb9.svg)
[![iOS](https://img.shields.io/badge/iOS-8.0%2B-1b7cb9.svg)](https://img.shields.io/badge/iOS-9.0%2B-1b7cb9.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xremix/SwiftDebouncer/blob/master/LICENSE)

## Description
A Swift Library for a debounce function, similar to the JavaScript debounce.
The Debouncer will delay a function call, and every time it's getting called it will delay the preceding call until the delay time is over.

## Getting started

Use the following code to instantiate a debouncer.
You can pass a parameter `delay` (in `ms` of type TimerInterval) and optional an callback function.

```SWIFT
let debouncer = Debouncer(delay: 10)
d.callback = {
// your code here
}

d.call()
```

###  Properties

- `callback` Callback that is getting called when the timer fires
- `delay` Delay Time in ms
- `fireDate` Next Date when the Debouncer will fire

### Functions
- `call` Call debouncer to start the callback after the delayed time. Multiple calls will ignore the older calls and overwrite the firing time


## Installation

### CocoaPods

You can install [the library](https://cocoapods.org/pods/SwiftDebouncer) to your project by using [CocoaPods](https://cocoapods.org). Add the following code to your `Podfile`:
```
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
pod 'SwiftDebouncer'
end
```

### Git Submodule

You can add the project as a git `submodule`. Simply drag the `SwiftGS1Barcode.xcodeproj` file into your Xcode project.
**Don't forget to add the framework in your application target**

### Manually

Just copy and paste the [`Debouncer.swift`](https://github.com/xremix/SwiftDebouncer/blob/master/SwiftDebouncer/Debouncer.swift) file into your project.


## Ressources

#### CocoaPod
https://www.appcoda.com/cocoapods-making-guide/


![Analytics](https://ga-beacon.appspot.com/UA-40522413-9/SwiftDebouncer/readme?pixel)

