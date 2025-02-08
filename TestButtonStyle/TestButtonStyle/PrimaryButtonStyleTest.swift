//
//  PrimaryButtonStyleTest.swift
//  TestButtonStyle
//
//  Created by James Thang on 2/2/25.
//

import SwiftUI

struct PrimaryButtonStyleTest: View {
    var body: some View {
        VStack {
            Button("Press me!") { }
                .buttonStyle(.primary)
            
            Button { } label: { Text("Tap me!") }
            .buttonStyle(.primary(textColor: .black, backgroundColor: .yellow))
        }
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    
    static var primary: PrimaryButtonStyle { .init() }
    
    static func primary(textColor: Color, backgroundColor: Color) -> Self {
        .init(textColor: textColor, backgroundColor: backgroundColor)
    }
    
}


struct PrimaryButtonStyle: ButtonStyle {
    
    private let textColor: Color
    private let backgroundColor: Color
    
    init(textColor: Color = .white, backgroundColor: Color = .accentColor) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .clipShape(Capsule(style: .continuous))
    }
}

#Preview {
    PrimaryButtonStyleTest()
}
