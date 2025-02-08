# ButtonStyle

[![Pod Platform](http://img.shields.io/cocoapods/p/SDWebImage.svg?style=flat)](http://cocoadocs.org/docsets/SDWebImage/)
[![Pod Version](http://img.shields.io/cocoapods/v/SDWebImage.svg?style=flat)](https://cocoapods.org/pods/Tutorials)
[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)

## Table of Contents
1. [Overview](#overview)
2. [Features](#features)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage](#usage)
6. [Author](#author)

## Overview

In `SwiftUI`, a `ButtonStyle` is a `protocol` that allows developers to define custom appearances and interactions for buttons. By conforming to this protocol, we can encapsulate styling logic into reusable components, ensuring a consistent look and feel across our application. 

Instead of individually styling each button, a `ButtonStyle` defines how a button appears and responds to user interactions (such as taps or presses) in a single place. This approach not only simplifies maintenance but also promotes a cohesive user interface design.

<img src="https://github.com/user-attachments/assets/89fcae09-da1b-4470-96b1-b01bd75a692f" width="220">
<img src="https://github.com/user-attachments/assets/bd90bcd0-3510-4796-903e-4f78ac4b12c3" width="220">
<img src="https://github.com/user-attachments/assets/c6d4ba82-51a0-4f93-8632-6e564839e7cb" width="220">

Our SDK leverages the power of `ButtonStyle` to provide a suite of ready-to-use, customizable button styles. These styles—such as `CapsuleButtonStyle`, `ShapeButtonStyle`, `BouncyButtonStyle`, `GrowingButtonStyle`, and `LoadingButtonStyle` are designed to cover a wide range of use cases, from modern, rounded buttons to dynamic, interactive effects.

## Features

Addresses common challenges in UI design by offering:

- **Pre-defined Button Designs**: A library of thoughtfully crafted button styles that cover a range of aesthetics and use cases, saving time and design effort.
- **Flexibility**: Easy-to-adjust parameters allow for a high degree of customization without the need to rewrite or deeply understand the underlying implementation.
- **Improved User Experience**: Interactive effects and visual feedback not only make the UI more appealing but also guide users intuitively through their interactions, enhancing overall satisfaction.
- **Seamless Integration and Multi-Platform Support**: Designed to work out of the box with `SwiftUI` across `iOS`, `macOS`, `tvOS`, `watchOS`, and `visionOS`, our button styles can be applied with a single modifier. This makes it straightforward for developers to upgrade their app's UI with minimal effort while ensuring a consistent look and feel across all Apple platforms.

## Requirements

| Platform | Minimum Version |
|----------|-----------------|
| iOS      | 15.0            |
| macOS    | 12.0            |
| tvOS     | 15.0            |
| watchOS  |  8.0            |
| visionOS |  1.0            |

 ## Installation
This project can be installed using `Swift Package Manager` and `CocoaPod`.

### Swift Package Manager

1. Open your project in Xcode.
2. Navigate to `File` > `Swift Packages` > `Add Package Dependency`.
3. Paste the repository URL: `https://github.com/Enryun/ButtonStyle`
4. Follow the prompts to add the package to your project.

For more details on using Swift Package Manager, visit [Apple's Swift Package Manager documentation](https://swift.org/package-manager/).

### CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

Add the following entry to your Podfile:

```rb
pod 'ButtonStyle'
```

Then run `pod install`.

Don't forget to `import ButtonStyle` in every file you'd like to use it.

## Usage

## CapsuleButtonStyle:

A `ButtonStyle` for SwiftUI that applies a Capsule Shape with customizable color styles.

```swift
CapsuleButtonStyle(textColor: Color.white, backgroundColor: gradient)
```

Parameters:
- `textColor`: The color or style applied to the text inside the button. Defaults to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Defaults to `.blue`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("Capsule 1") { }
            .buttonStyle(.capsule)
//          .buttonStyle(CapsuleButtonStyle())
    
        Button("Capsule 2") { }
            .buttonStyle(CapsuleButtonStyle(textColor: .black, backgroundColor: .green))

        // Alternatively, we have shortcut enumcase usage
        Button("Capsule 3") { }
            .buttonStyle(.capsule(textColor: .white, backgroundColor: gradient))
    
        Button(action: {}, label: {
            HStack {
                Image(systemName: "cloud.sun")
                Text("Capsule 4")
            }
        })
        .buttonStyle(.capsule(textColor: Color.white, backgroundColor: gradient))
    }
}
```

<img src="https://github.com/user-attachments/assets/89fcae09-da1b-4470-96b1-b01bd75a692f" width="220">

This style gives buttons a modern, rounded look suitable for various UI contexts.

## ShapeButtonStyle:

A `ButtonStyle` for SwiftUI that allows customization of the button's shape and color.

```swift
ShapeButtonStyle(textColor: .white, backgroundColor: gradient, shape: .circle)
```

Parameters:
- `textColor`: The color or style applied to the text inside the button. Default is `.primary`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`. Default is `.secondary`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("ShapeButton 1") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .blue, shape: .rect))
    
        Button("ShapeButton 2") { }
            .buttonStyle(ShapeButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 8)))
    
        Button("ShapeButton 3") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .red, shape: .capsule))
                
        Button("ShapeButton 4") { }
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: .orange, shape: .ellipse))
    
        Button(action: {}, label: {
            Image(systemName: "heart.fill")
                .font(.title)
                .padding(5)
            })
            .buttonStyle(ShapeButtonStyle(textColor: .white, backgroundColor: gradient, shape: .circle))
    }
}
```

<img src="https://github.com/user-attachments/assets/bd90bcd0-3510-4796-903e-4f78ac4b12c3" width="220">

This style modifies the appearance of buttons to fit within a specified shape, with customizable foreground, background colors and padding. It is highly flexible, accommodating various shapes and color styles.

## BouncyButtonStyle

A customizable `ButtonStyle` for SwiftUI that simulates a bouncy 3D press effect.

```swift
BouncyButtonStyle()
```

Parameters:
- `textColor`: The color of the text when the button is not pressed.
- `pressedTextColor`: The color of the text when the button is pressed.
- `backgroundColor`: The background color of the button when it's not pressed.
- `pressedBackgroundColor`: The background color of the button when pressed.
- `shape`: The shape of the button, conforming to the `Shape` protocol.
- `verticalPadding`: The vertical padding inside the button.
- `horizontalPadding`: The horizontal padding inside the button.

Example:

```swift
Button("Cartoon Button") { }
    .buttonStyle(BouncyButtonStyle())

Button("Cartoon Button") { }
    .buttonStyle(BouncyButtonStyle(shape: .rect(cornerRadius: 4)))

Button(action: { }, label: {
    Image(systemName: "heart.fill")
        .font(.title)
        .padding(5)
})
.buttonStyle(BouncyButtonStyle(shape: .circle))

Button("Cartoon Button") { }
    .buttonStyle(BouncyButtonStyle(textColor: .black,
                                   pressedTextColor: .black,
                                   backgroundColor: .green,
                                   pressedBackgroundColor: .orange))
```

`BouncyButtonStyle` applies a dynamic and interactive visual effect to button presses, enhancing user experience with a noticeable 'pop'. It's ideal for adding a playful and engaging touch to UI components:

https://github.com/user-attachments/assets/f4d5dd43-3781-4311-a53d-5a5304d86779

This style configures the button to exhibit a bouncy animation upon interaction, with adjustable visual properties.

## GrowingButtonStyle:

A `ButtonStyle` for SwiftUI that scales the button on press, with customizable shape and color styles.

```swift
GrowingButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 4))
```

Parameters:
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)

var body: some View {
    VStack(spacing: 25) {
        Button("Growing 1") { }
            .buttonStyle(GrowingButtonStyle())
        
        Button("Growing 2") { }
            .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: .green, shape: .rect(cornerRadius: 4)))
        
        Button("Growing 3") { }
            .buttonStyle(GrowingButtonStyle(textColor: .primary, backgroundColor: gradient, shape: .rect(cornerRadius: 4)))
    }
}
```

https://github.com/user-attachments/assets/9520da94-8b87-4a84-83e9-da7b79dbaeab

This button style provides an interactive feedback effect by increasing the button's scale when pressed. It allows for customization of the button's foreground and background colors, shape, and padding.

## LoadingButtonStyle:

A `ButtonStyle` for SwiftUI that provides a customizable button with a loading indicator.

```swift
LoadingButtonStyle(isLoading: $isLoading, loadingState: .resize, backgroundColor: .indigo)
```

Parameters:
- `isLoading`: A binding to a boolean indicating whether the button is in a loading state.
- `loadingState`: An enum that determines the button's behavior when loading. Defaults to `.center`.
- `textColor`: The color or style for the text inside the button, defaulting to `.white`.
- `backgroundColor`: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
- `disabledLoadingColor`: The background color or style of the button when it is loading, conforming to `ShapeStyle`, with a default of `.gray`.
- `shape`: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
- `verticalPadding`: The vertical padding inside the button. Defaults to `10`.
- `horizontalPadding`: The horizontal padding inside the button. Defaults to `20`.

Example:

```swift
@State private var isLoading: Bool = false

var body: some View {
    VStack(spacing: 25) {
        Button("Loading Button 1") {
            isLoading = true
            // Simulate a network request or some action
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }.buttonStyle(LoadingButtonStyle(isLoading: $isLoading))
        
        Button("Loading Button 2") {}
            .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .leading, backgroundColor: .cyan, horizontalPadding: 40))
        
        Button(action: {}, label: {
            Text("Loading Button 3")
                .frame(width: 250, height: 40)
        })
        .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .resize, backgroundColor: .indigo))
        
        Button(action: {}, label: {
            HStack(spacing: 12) {
                Image(systemName: "person.crop.circle")
                    .font(.title2)
                
                Text("Loading Button 4")
                    .font(.title)
            }
            .frame(width: 250, height: 40)
        })
        .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .leading, backgroundColor: .red, disabledLoadingColor: .red.opacity(0.5)))
        
        Button(action: {}, label: {
            Image(systemName: "heart.fill")
                .font(.title)
                .padding(5)
        })
        .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .top, backgroundColor: .green, shape: .circle))
    }
}
```

https://github.com/user-attachments/assets/b6fa0b46-53dc-4f81-bc84-fd467c74e407

This button style offers interactive feedback by displaying a `ProgressView` when in a loading state. It allows for extensive customization of the button's appearance, including text color, background color, shape, padding, and the position of the loading indicator. When loading, the button can optionally gray out the background and disable user interactions.

## Author

James Thang, find me on [LinkedIn](https://www.linkedin.com/in/jamesthang/)

Learn more about SwiftUI, check out my book :books: on [Amazon](https://www.amazon.com/Ultimate-SwiftUI-Handbook-iOS-Developers-ebook/dp/B0CKBVY7V6/ref=tmm_kin_swatch_0?_encoding=UTF8&qid=1696776124&sr=8-1)
