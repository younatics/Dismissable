# Dismissable
[![Version](https://img.shields.io/cocoapods/v/Dismissable.svg?style=flat)](http://cocoapods.org/pods/Dismissable)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/younatics/Dismissable/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Dismissable.svg?style=flat)](http://cocoapods.org/pods/Triangulation)
[![Swift 4.0](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)

## Introduction
⚡️Pull to dismiss your model view! `Dismissable` is super convenient to dismiss with gesture!

![demo](https://github.com/younatics/Dismissable/blob/master/image/Dismissable.gif)

## Requirements

`Dismissable` is written in Swift 4.2. Compatible with iOS 9.0+

## Installation

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

Inherit `DismissTriggerUIViewController` where present modal view
```swift
class ViewController: DismissTriggerUIViewController
```
Inherit `DismissableUIViewController` in modal view
```swift
class DetailViewController: DismissableUIViewController
```
Add `dismissable` when prsent modal view
```swift
let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! DetailViewController
vc.dismissable = (self, dismissInteractor)
self.present(vc, animated: true, completion: nil)
```

Also you can customize dismiss animator
```swift
dismissAnimator.transitionDuration = 0.35
dismissAnimator.dimmedViewStartColor = UIColor.black.withAlphaComponent(0.4)
dismissAnimator.dimmedViewEndColor = UIColor.black.withAlphaComponent(0)
```

## References
#### Please tell me or make pull request if you use this library in your application :) 

## Author
[younatics](https://twitter.com/younatics)
<a href="http://twitter.com/younatics" target="_blank"><img alt="Twitter" src="https://img.shields.io/twitter/follow/younatics.svg?style=social&label=Follow"></a>

## License
Dismissable is available under the MIT license. See the LICENSE file for more info.
