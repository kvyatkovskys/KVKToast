[![CI Status](https://img.shields.io/travis/kvyatkovskys/KVKToast.svg?style=flat)](https://travis-ci.org/kvyatkovskys/KVKToast)
[![Version](https://img.shields.io/cocoapods/v/KVKToast.svg?style=flat)](https://cocoapods.org/pods/KVKToast)
[![Carthage](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=fla)](https://github.com/Carthage/Carthage/)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)](https://swiftpackageindex.com/kvyatkovskys/KVKToast)
[![Platform](https://img.shields.io/cocoapods/p/KVKToast.svg?style=flat)](https://cocoapods.org/pods/KVKToast)
[![License](https://img.shields.io/cocoapods/l/KVKToast.svg?style=flat)](https://cocoapods.org/pods/KVKToast)

# KVKToast

## Requirements

- iOS 10.0+, iPadOS 10.0+, MacOS 10.15+ (Supports Mac Catalyst)
- Swift 5.0+

## Installation

**KVKToast** is available through [CocoaPods](https://cocoapods.org) or [Carthage](https://github.com/Carthage/Carthage) or [Swift Package Manager](https://swift.org/package-manager/).

### CocoaPods
~~~bash
pod 'KVKToast'
~~~

[Adding Pods to an Xcode project](https://guides.cocoapods.org/using/using-cocoapods.html)

### Carthage
~~~bash
github "kvyatkovskys/KVKToast"
~~~

[Adding Frameworks to an Xcode project](https://github.com/Carthage/Carthage#quick-start)

### Swift Package Manager (Xcode 12 or higher)

1. In Xcode navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Select a project
3. Paste the repository URL (`https://github.com/kvyatkovskys/KVKToast.git`) and click **Next**.
4. For **Rules**, select **Version (Up to Next Major)** and click **Next**.
5. Click **Finish**.

[Adding Package Dependencies to Your App](https://developer.apple.com/documentation/swift_packages/adding_package_dependencies_to_your_app)

## Usage for UIKit

To display a toast

```swift
view.displayToast("Test")
```

To display a toast with parameters

```swift
view.displayToast("Test", message: "Description", image: image, position: .top, type: .info, duration: 5)
```

To hide the latest toast immediately

```swift
view.hideToast()
```

To hide all toasts
```swift
view.hideAllToasts()
```

## Style


## Author

[Sergei Kviatkovskii](https://github.com/kvyatkovskys)

## License

KVKToast is available under the [MIT license](https://github.com/kvyatkovskys/KVKToast/blob/master/LICENSE.md)
