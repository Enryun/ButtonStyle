//
//  LoadingButtonStyle.swift
//  CommonSwiftUI
//
//  Created by James Thang on 03/06/2024.
//

import SwiftUI

/// A ButtonStyle for SwiftUI that provides a customizable button with a loading indicator.
///
/// This button style offers interactive feedback by displaying a `ProgressView` when in a loading state. It allows for extensive customization of the button's appearance, including text color, background color, shape, padding, and the position of the loading indicator. When loading, the button can optionally gray out the background and disable user interactions.
///
/// - Parameters:
///   - isLoading: A binding to a boolean indicating whether the button is in a loading state.
///   - loadingState: An enum that determines the button's behavior when loading. Defaults to `.center`.
///   - textColor: The color or style for the text inside the button, defaulting to `.white`.
///   - backgroundColor: The background color or style of the button, conforming to `ShapeStyle`, with a default of `.blue`.
///   - disabledLoadingColor: The background color or style of the button when it is loading, conforming to `ShapeStyle`, with a default of `.gray`.
///   - shape: The shape of the button, conforming to `Shape`, with a default of `Capsule()`.
///   - verticalPadding: The vertical padding inside the button, defaulting to `10`.
///   - horizontalPadding: The horizontal padding inside the button, defaulting to `20`.
///
/// ## Usage:
/// Default style:
/// ```swift
/// @State private var isLoading = false
///
/// Button("Default") {
///     isLoading = true
///     // Simulate a network request or some action
///     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
///         isLoading = false
///     }
/// }.buttonStyle(LoadingButtonStyle(isLoading: $isLoading))
/// ```
/// Custom style with progress on the left:
/// ```swift
/// @State private var isLoading = false
///
/// Button(action: {
///     isLoading = true
///     // Simulate a network request or some action
///     DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
///         isLoading = false
///     }
/// }, label: {
///     HStack(spacing: 12) {
///         Image(systemName: "person.crop.circle")
///             .font(.title2)
///
///         Text("Button")
///             .font(.title)
///     }
///     .frame(width: 250, height: 40)
/// })
/// .buttonStyle(LoadingButtonStyle(isLoading: $isLoading, loadingState: .leading, backgroundColor: .red, disabledLoadingColor: .red.opacity(0.5)))
/// ```
///
/// - Note: The `ProgressView` can be shown on the left, right, top, bottom, or in the center of the label, or it can resize the button, depending on the `loadingState` parameter. The button is disabled and grayed out when loading.
/// 
public struct LoadingButtonStyle<CustomShape: Shape, TextShapeStyle: ShapeStyle, BackgroundShapeStyle: ShapeStyle>: ButtonStyle {
    
    public enum LoadingButtonAppearance {
        case resize
        case leading
        case trailing
        case top
        case bottom
        case center
        case none
        
        var alignment: Alignment {
            switch self {
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .resize, .center, .none:
                return .center
            }
        }
        
        var paddingEdge: Edge.Set {
            switch self {
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .resize, .center, .none:
                return []
            }
        }
    }
    
    @Binding var isLoading: Bool
    private var textColor: TextShapeStyle
    private var backgroundColor: BackgroundShapeStyle
    private var disabledLoadingColor: BackgroundShapeStyle
    private var shape: CustomShape
    private var verticalPadding: CGFloat
    private var horizontalPadding: CGFloat
    private var loadingState: LoadingButtonStyle.LoadingButtonAppearance
    
    public init(isLoading: Binding<Bool>, loadingState: LoadingButtonStyle.LoadingButtonAppearance = .center, textColor: TextShapeStyle = .white, backgroundColor: BackgroundShapeStyle = .blue, disabledLoadingColor: BackgroundShapeStyle = .gray, shape: CustomShape = Capsule(), verticalPadding: CGFloat = 10, horizontalPadding: CGFloat = 20) {
        self._isLoading = isLoading
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.disabledLoadingColor = disabledLoadingColor
        self.shape = shape
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.loadingState = loadingState
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Group {
            switch loadingState {
            case .resize:
                if isLoading {
                    applyCommonStyles(
                        to: ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding(min(verticalPadding, horizontalPadding))
                    )
                } else {
                    applyCommonStyles(to: configuration.label)
                }
            case .none:
                applyCommonStyles(to: configuration.label)
            default:
                applyCommonStyles(
                    to: configuration.label
                        .opacity(isLoading ? (loadingState == .center ? 0 : 1) : 1)
                )
                .overlay(alignment: loadingState.alignment) {
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding(loadingState.paddingEdge)
                    }
                }
            }
        }
        .animation(.easeInOut, value: isLoading)
        .disabled(isLoading)
    }
    
    private func applyCommonStyles<Content: View>(to content: Content) -> some View {
        content
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .foregroundStyle(textColor)
            .background {
                shape
                    .fill(isLoading ? disabledLoadingColor : backgroundColor)
            }
    }
    
}
