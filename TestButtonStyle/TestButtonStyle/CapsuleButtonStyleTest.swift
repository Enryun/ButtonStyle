//
//  CapsuleButtonStyleTest.swift
//  TestButtonStyle
//
//  Created by James Thang on 10/1/25.
//

import SwiftUI
import ButtonStyle

struct CapsuleButtonStyleTest: View {
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        VStack(spacing: 25) {
            Button("Capsule 1") { }
                .buttonStyle(.capsule)
            
            Button("Capsule 2") { }
                .buttonStyle(.capsule(textColor: .black, backgroundColor: .green))
            
            Button("Capsule 3") { }
                .buttonStyle(.capsule(textColor: .white, backgroundColor: gradient))
            
            Button(action: { }, label: {
                HStack {
                    Image(systemName: "cloud.sun")
                    Text("Capsule 4")
                }
            })
            .buttonStyle(.capsule(textColor: Color.white, backgroundColor: gradient))
        }
    }
}

#Preview {
    CapsuleButtonStyleTest()
}
