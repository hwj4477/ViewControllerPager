# ViewControllerPager

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

<img src="./preview.gif" width="200" alt="Screenshot" />

# Installation
### CocoaPods
In your `Podfile`:
```
pod "ViewControllerPager"
```
And in your `*.swift`:
```swift
import ViewControllerPager
```

# Usage
### set Delegate
```swift
class ViewController: ViewControllerPagerDelegate, ViewControllerPagerDataSource {

    @IBOutlet weak var viewControllerPager: ViewControllerPager!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllerPager.dataSource = self
        viewControllerPager.delegate = self

        viewControllerPager.reloadPages()
    }
}

```
### ViewControllerPagerDataSource
```swift
// set pages
func pageViewController(_ viewControllerPager: ViewControllerPager, index: Int) -> PageViewController?
func pageCount(_ viewControllerPager: ViewControllerPager) -> Int
```

### ViewControllerPagerDelegate
```swift
// page change event
@objc optional func didAppearPage(_ viewControllerPager: ViewControllerPager, index: Int)
@objc optional func didDisAppearPage(_ viewControllerPager: ViewControllerPager, index: Int)
```

### Functions
```swift
// be returned PageViewController for reuse
func dequeueReuseablePageWithIdentifier(_ identifier: String) -> PageViewController?
```
