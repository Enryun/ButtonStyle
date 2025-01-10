//
//  GrowingButton.swift
//  CommonSwiftUI
//
//  Created by James Thang on 04/09/2023.
//

import SwiftUI

/// A ButtonStyle for SwiftUI that scales the button on press, with customizable shape and color styles.
///
/// This button style provides an interactive feedback effect by increasing the button's scale when pressed. It allows for customization of the button's foreground and background colors, shape, and padding.
///
///
/// - Parameters:
///   - textColor: The color or style for the text inside the button, defaulting to `.white`.
///   - backgroundColor: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
///   - shape: The shape of the button, conforming to `Shape`, with a default of `Capsule()`.
///   - verticalPadding: The vertical padding inside the button. Defaults to `10`.
///   - horizontalPadding: The horizontal padding inside the button. Defaults to `20`.
///
/// ## Usage:
/// Default style:
/// ```swift
/// Button("Default") {
///     // Default action
/// }.buttonStyle(GrowingButtonStyle())
/// ```
/// Custom style:
/// ```swift
/// Button("Custom") {
///     // Custom action
/// }.buttonStyle(
///     GrowingButtonStyle(
///         textColor: Color.white,
///         backgroundColor: LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing),
///         shape: .rect(cornerRadius: 4)
///     )
///)
/// ```
///
/// - Note: The scale effect makes the button visually increase in size when pressed, improving user experience.
public struct GrowingButtonStyle<CustomShape: Shape, TextShapeStyle: ShapeStyle, BackgroundShapeStyle: ShapeStyle>: ButtonStyle {
    
    private var textColor: TextShapeStyle
    private var backgroundColor: BackgroundShapeStyle
    private var shape: CustomShape
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    
    public init(textColor: TextShapeStyle = .white, backgroundColor: BackgroundShapeStyle = .blue, shape: CustomShape = Capsule(), verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 20) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.shape = shape
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .foregroundStyle(textColor)
            .background(content: {
                shape
                    .foregroundStyle(backgroundColor)
            })
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

