# NBSpriteImage

![CocoaPods Compatible](https://img.shields.io/badge/version-0.1-green.svg)
![Platform iOS](https://img.shields.io/badge/platform-ios-blue.svg)
![License MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)

![Screenshot](https://s26.postimg.org/rlx2ow7i1/animate.gif)

## Introduction
NBSpriteImage is a small library to create and animate spriteImages from sprite sheet. It is fully customizable. You can fetch the sprite images from sprite sheet and customize your animation or directly animate them.

## Requirements
* iOS 8+
* Xcode 9.0+

## Installation 
### CocoaPods
Add the NBSpriteImage pod into your project and run `pod install`
```ruby
pod 'NBSpriteImage'
```
### Manual Install
Download NBSpriteImage and import `NBSpriteImage.swift` inside your xcode project.

## Sample App
To start using NBSpriteImage you can build the provided example project

1. Open `Example/NBSpriteImage.xcodeproj` in Xcode.
2. Build and run.

## Usage
It's very easy to set up, just import NBSpriteImage in your Swift code:
```swift
import NBSpriteImage
```
### Interface Builder:
Add an UIImageView with interface builder and link it with the outlet property declared in your code.

```swift
@IBOutlet private weak var imageView: UIImageView!
```
Then you can simply animate it using
```swift
self.imageView.animateWithSpriteSheet(spriteSheet: image, spriteSize: CGSize(width: 48, height: 48))
```
Here sprite size is the size of each sprite image.

## FPS
By default fbs of animation will be 15 fps. If you want to change it you can change it by
```swift
self.imageView.animateWithSpriteSheet(spriteSheet: image, spriteSize: CGSize(width: 48, height: 48), fps: 30)
```

## Range
If you want to run animation from a particular frame to a desired frame then you can do so by providing the range.
```swift
self.imageView.animateWithSpriteSheet(spriteSheet: image, spriteSize: CGSize(width: 48, height: 48), range: 0...31 , fps: 30)
```

## License
NBSpriteImage is available under the MIT license. See the LICENSE file for more info.
