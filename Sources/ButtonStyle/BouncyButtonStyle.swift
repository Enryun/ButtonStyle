//
//  BouncyButtonStyle.swift
//  CommonSwiftUI
//
//  Created by James Thang on 23/08/2024.
//

import SwiftUI

/// A customizable `ButtonStyle` for SwiftUI that simulates a bouncy 3D press effect.
///
/// `BouncyButtonStyle` applies a dynamic and interactive visual effect to button presses, enhancing user experience with a noticeable 'pop'. It's ideal for adding a playful and engaging touch to UI components.
///
/// - Parameters:
///   - textColor: The color of the text when the button is not pressed.
///   - pressedTextColor: The color of the text when the button is pressed.
///   - backgroundColor: The background color of the button when it's not pressed.
///   - pressedBackgroundColor: The background color of the button when pressed.
///   - shape: The shape of the button, conforming to the `Shape` protocol.
///   - verticalPadding: The vertical padding inside the button.
///   - horizontalPadding: The horizontal padding inside the button.
///
/// ## Usage:
/// ```swift
/// Button("Click Me", action: {})
///     .buttonStyle(BouncyButtonStyle())
/// ```
/// This style configures the button to exhibit a bouncy animation upon interaction, with adjustable visual properties.
public struct BouncyButtonStyle<CustomShape: Shape, TextShapeStyle: ShapeStyle, BackgroundShapeStyle: ShapeStyle>: ButtonStyle {
    
    private var textColor: TextShapeStyle
    private var pressedTextColor: TextShapeStyle
    private var backgroundColor: BackgroundShapeStyle
    private var pressedBackgroundColor: BackgroundShapeStyle
    private var shape: CustomShape
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    
    public init(textColor: TextShapeStyle = .black, pressedTextColor: TextShapeStyle = .white, backgroundColor: BackgroundShapeStyle = .yellow, pressedBackgroundColor: BackgroundShapeStyle = .cyan, shape: CustomShape = Capsule(), verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 20) {
        self.textColor = textColor
        self.pressedTextColor = pressedTextColor
        self.backgroundColor = backgroundColor
        self.pressedBackgroundColor = pressedBackgroundColor
        self.shape = shape
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .offset(y: configuration.isPressed ? -0.5 : 0)
            .foregroundStyle(configuration.isPressed ? pressedTextColor : textColor)
            .background {
                ZStack {
                    shape
                        .fill(.primary)
                        .padding(configuration.isPressed ? -2 : -3.5)
                        .offset(y: configuration.isPressed ? 0.2 : 1.5)
                    
                    shape
                        .fill(configuration.isPressed ? pressedBackgroundColor : backgroundColor)
                }
            }
            .overlay {
                shape
                    .stroke(lineWidth: 2)
                    .foregroundStyle(.background)
            }
            .animation(.linear, value: configuration.isPressed)
    }
    
}
