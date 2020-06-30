<img src="https://sun1-10.userapi.com/c604520/v604520977/3eb44/heULhAh4scA.jpg" width="100%">

![CocoaPods Compatible](https://img.shields.io/badge/pod-v1.0.0-blue.svg)
![Platform](https://img.shields.io/badge/platform-ios-lightgray.svg)
![Twitter Follow](https://img.shields.io/twitter/follow/appus_studio.svg?style=social&label=Follow)

## Requirements

- iOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### Template

```bash
git clone git@gitlab.appus.software:ios/VIPER-template.git
cd ./VIPER-template/Template
sudo swift install.swift
```

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AppusViper into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    #pod 'AppusViper', :git => 'git@gitlab.appus.software:ios/VIPER-template.git', :tag => '1.1.0'
    #pod 'AppusViper', :git => 'git@gitlab.appus.software:ios/VIPER-template.git', :tag => '2.0.0'
end
```

Then, run the following command:

```bash
$ pod install
```

## License

AppusViper is released under the MIT license. [See LICENSE](LICENSE) for details.