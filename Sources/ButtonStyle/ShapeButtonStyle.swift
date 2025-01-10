//
//  ShapeButtonStyle.swift
//  CommonSwiftUI
//
//  Created by James Thang on 17/03/2024.
//

import SwiftUI

/// A ButtonStyle for SwiftUI that allows customization of the button's shape and color.
///
/// This style modifies the appearance of buttons to fit within a specified shape, with customizable foreground, background colors and padding. It is highly flexible, accommodating various shapes and color styles.
///
/// - Parameters:
///   - textColor: The color or style applied to the text inside the button. Default is `.primary`.
///   - backgroundColor: The background color or style of the button, conforming to `ShapeStyle`. Default is `.secondary`.
///   - shape: The custom shape for the button, conforming to `Shape`. The default shape is `Capsule()`.
///   - verticalPadding: The vertical padding inside the button. Defaults to `10`.
///   - horizontalPadding: The horizontal padding inside the button. Defaults to `20`.
///
/// ## Usage:
/// ```swift
/// Button("Click Me") {
///     // Action to perform
/// }.buttonStyle(ShapeButtonStyle())
/// ```
///
/// ## Additional Usage:
/// Customizing the button with non-default values:
/// ```swift
/// Button("Submit") {
///     // Action to perform
/// }.buttonStyle(
///     ShapeButtonStyle(
///         textColor: Color.white,
///         backgroundColor: LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing),
///         shape: .rect(cornerRadius: 4)
///     )
/// )
/// ```
/// - Note: Customize the `textColor`, `backgroundColor`, and `shape` parameters to create varied button styles.
public struct ShapeButtonStyle<CustomShape: Shape, TextShapeStyle: ShapeStyle, BackgroundShapeStyle: ShapeStyle>: ButtonStyle {
    
    private var textColor: TextShapeStyle
    private var backgroundColor: BackgroundShapeStyle
    private var shape: CustomShape
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    
    public init(textColor: TextShapeStyle = .primary, backgroundColor: BackgroundShapeStyle = .secondary, shape: CustomShape = Capsule(), verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 20) {
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
                    .fill(backgroundColor)
            })
    }
}

