//
//  PressableButtonStyle.swift
//  CommonSwiftUI
//
//  Created by James Thang on 02/06/2024.
//

import SwiftUI

/// A button style that applies a scale effect to indicate a press action.
///
/// `PressableButtonStyle` provides visual feedback by scaling down the button when pressed and returning it to normal size when released. This style enhances the interactive experience by visually responding to user taps.
///
/// ## Example Usage:
/// ```swift
/// Button("Press Me") {
///     print("Button pressed")
/// }
/// .buttonStyle(PressableButtonStyle())
/// ```
///
/// This style is useful for buttons where immediate visual feedback is desired to enhance user interaction, making it clear when the button is actively being pressed.
/// 
public struct PressableButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.snappy(duration: 0.3, extraBounce: 0), value: configuration.isPressed)
    }
    
}
