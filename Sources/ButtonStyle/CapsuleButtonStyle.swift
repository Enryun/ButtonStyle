//
//  CapsuleButton.swift
//  CommonSwiftUI
//
//  Created by James Thang on 04/09/2023.
//

import SwiftUI

/// A ButtonStyle for SwiftUI that applies a capsule shape with customizable color styles.
///
/// This style changes the appearance of buttons to have a capsule shape, with options for customizing the foreground and background colors,
/// as well as vertical and horizontal padding.
///
/// - Parameters:
///   - textColor: The color or style applied to the text inside the button. Defaults to `.white`.
///   - backgroundColor: The background color or style of the button, conforming to `ShapeStyle`. Defaults to `.blue`.
///   - verticalPadding: The vertical padding inside the button. Defaults to `10`.
///   - horizontalPadding: The horizontal padding inside the button. Defaults to `20`.
///
/// ## Usage:
/// Default style:
/// ```swift
/// Button("Default Button") {
///     // Default action
/// }.buttonStyle(CapsuleButtonStyle())
/// ```
/// Custom style:
/// ```swift
/// Button("Custom") {
///     // Custom action
/// }.buttonStyle(
///     CapsuleButtonStyle(
///         textColor: Color.white,
///         backgroundColor: LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)
///     )
///)
/// ```
/// This style gives buttons a modern, rounded look suitable for various UI contexts.
public struct CapsuleButtonStyle<TextShapeStyle: ShapeStyle, BackgroundShapeStyle: ShapeStyle>: ButtonStyle {
    
    private var textColor: TextShapeStyle
    private var backgroundColor: BackgroundShapeStyle
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    
    public init(textColor: TextShapeStyle = .white, backgroundColor: BackgroundShapeStyle = .blue, verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 20) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .foregroundStyle(textColor)
            .background {
                Capsule().foregroundStyle(backgroundColor)
            }
    }
}

public extension ButtonStyle where Self == CapsuleButtonStyle<Color, Color> {
    /**
     Creates a capsule-shaped button style with solid colors for both the text and background.
     
     - Parameters:
     - textColor: The color used for the button text. Defaults to `.white`.
     - backgroundColor: The color used for the button background. Defaults to `.blue`.
     - verticalPadding: The amount of vertical padding inside the button. Defaults to `10`.
     - horizontalPadding: The amount of horizontal padding inside the button. Defaults to `20`.
     
     - Returns: A `CapsuleButtonStyle` configured with the specified text color, background color, and padding.
     */
    static func capsule(
        textColor: Color = .white,
        backgroundColor: Color = .blue,
        verticalPadding: CGFloat = 10,
        horizontalPadding: CGFloat = 20
    ) -> Self {
        .init(
            textColor: textColor,
            backgroundColor: backgroundColor,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}

public extension ButtonStyle where Self == CapsuleButtonStyle<Color, LinearGradient> {
    /**
     Creates a capsule-shaped button style with a solid color for the text and a `LinearGradient` for the background.
     
     - Parameters:
     - textColor: The color used for the button text. Defaults to `.white`.
     - backgroundColor: The gradient used for the button background.
     - verticalPadding: The amount of vertical padding inside the button. Defaults to `10`.
     - horizontalPadding: The amount of horizontal padding inside the button. Defaults to `20`.
     
     - Returns: A `CapsuleButtonStyle` configured with the specified text color, gradient background, and padding.
     */
    static func capsule(
        textColor: Color = .white,
        backgroundColor: LinearGradient,
        verticalPadding: CGFloat = 10,
        horizontalPadding: CGFloat = 20
    ) -> Self {
        .init(
            textColor: textColor,
            backgroundColor: backgroundColor,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}

