# Dismissable
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-brightgreen.svg?style=flat)](https://github.com/younatics/Dismissable/blob/master/Package.swift)
[![CocoaPods](https://img.shields.io/cocoapods/v/Dismissable.svg?style=flat)](https://cocoapods.org/pods/Dismissable)
[![Platform](https://img.shields.io/badge/platform-iOS%2013.0%2B-blue.svg?style=flat)](https://github.com/younatics/Dismissable/blob/master/Package.swift)
[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg?style=flat)](https://www.swift.org/)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Dismissable/blob/master/LICENSE)

## Introduction
⚡️Pull to dismiss your modal view! `Dismissable` is super convenient to dismiss with gesture!

![demo](https://github.com/younatics/Dismissable/blob/master/image/Dismissable.gif)

## Requirements

`Dismissable` requires iOS 13.0 or later and Swift 6.0 with Swift tools version 6.0. Supports Swift Package Manager and CocoaPods.

## Installation

### Swift Package Manager

In Xcode, choose **File ▸ Add Package Dependencies…** and enter:

```
https://github.com/younatics/Dismissable.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/younatics/Dismissable.git", from: "2.0.0")
]
```

### CocoaPods

Dismissable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Dismissable', '2.0.0'
```

## Usage

Conform `DismissTriggerUsable` in the view controller that presents the modal view controller:
```swift
class ViewController: UIViewController, DismissTriggerUsable
```
Conform `DismissableUsable` in the modal view controller:
```swift
class DetailViewController: UIViewController, DismissableUsable
```
Call `setup(_:)` before presenting the modal view controller:
```swift
var vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
vc.setup(self)
present(vc, animated: true, completion: nil)
```

Also you can customize dismiss animator
```swift
var dismissAnimator: DismissAnimator = {
  let animator = DismissAnimator()
  animator.transitionDuration = 0.35
  animator.dimmedViewStartColor = UIColor.black.withAlphaComponent(0.4)
  animator.dimmedViewEndColor = UIColor.black.withAlphaComponent(0)
  return animator
 }()
```

## References
#### Please tell me or make pull request if you use this library in your application :) 

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
Dismissable is available under the MIT license. See the LICENSE file for more info.
