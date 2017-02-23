# ReviewPlz

[![Version](https://img.shields.io/cocoapods/v/ReviewPlz.svg?style=flat)](http://cocoapods.org/pods/ReviewPlz)
[![License](https://img.shields.io/cocoapods/l/ReviewPlz.svg?style=flat)](http://cocoapods.org/pods/ReviewPlz)
[![Platform](https://img.shields.io/cocoapods/p/ReviewPlz.svg?style=flat)](http://cocoapods.org/pods/ReviewPlz)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Swift usage

```Swift
import ReviewPlz

let appID = "1177884800" // Use your app ID
let daysLater = 7 // If a user touch 'No thanks' button, the view will be shown the days later.
if let reviewController = ReviewPlzViewController.init(withAppId: appID, daysLater: daysLater) {
  self.present(reviewController, animated: false) {}
}
```
## Requirements

## Installation

ReviewPlz is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReviewPlz"
```

## Author

Jongwon Woo, jongwonwoo1@gmail.com

## License

ReviewPlz is available under the MIT license. See the LICENSE file for more info.
