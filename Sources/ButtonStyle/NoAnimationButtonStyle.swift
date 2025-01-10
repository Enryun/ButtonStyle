//
//  NoAnimationButtonStyle.swift
//  CommonSwiftUI
//
//  Created by James Thang on 02/06/2024.
//

import SwiftUI

/// A button style that disables all animations for button interactions.
///
/// `NoAnimationButtonStyle` is a SwiftUI button style that renders the button without any interactive effects, such as visual feedback on taps. This style is particularly useful when you need the button to appear as a static element without any response to user interactions, maintaining its initial appearance regardless of its state.
///
/// ## Example Usage:
/// ```swift
/// Button("Click Me") {
///     print("Button tapped")
/// }
/// .buttonStyle(NoAnimationButtonStyle())
/// ```
///
/// This style can be applied to any SwiftUI button where animations are not desired, making it ideal for UIs that require a more subdued interaction experience.
/// 
public struct NoAnimationButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
    
}
