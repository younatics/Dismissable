# Dismissable
[![Version](https://img.shields.io/cocoapods/v/Dismissable.svg?style=flat)](http://cocoapods.org/pods/Dismissable)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Dismissable/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Dismissable.svg?style=flat)](http://cocoapods.org/pods/Triangulation)
[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg?style=flat)](https://developer.apple.com/swift/)

## Introduction
⚡️Pull to dismiss your modal view! `Dismissable` is super convenient to dismiss with gesture!

![demo](https://github.com/younatics/Dismissable/blob/master/image/Dismissable.gif)

## Requirements

`Dismissable` is written in Swift 6. Compatible with iOS 13.0+. Supports Swift Package Manager, CocoaPods, and Carthage.

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

### Cocoapods

Dismissable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Dismissable'
```
### Carthage
```
github "younatics/Dismissable"
```

## Usage

Conform `DismissTriggerUsable` where present modal ViewController
```swift
class ViewController: UIViewController, DismissTriggerUsable
```
Conform `DismissableUsable` in modal ViewController
```swift
class DetailViewController: UIViewController, DismissableUsable
```
Add `dismissable` when prsent modal view
```swift
let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
vc.setup(self)
self.present(vc, animated: true, completion: nil)
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
