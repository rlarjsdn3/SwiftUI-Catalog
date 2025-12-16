//
//  Button_PressInteraction.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

private struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(
                configuration.role == .cancel
                ? .title2.bold()
                : .title2
            )
            .foregroundStyle(
                configuration.role == .destructive
                ? Color.red
                : Color.yellow
            )
            .opacity(
                configuration.isPressed
                ? 0.5
                : 1.0
            )
    }
}

private extension ButtonStyle where Self == MyButtonStyle {
    static var myButtonStyle: Self { MyButtonStyle() }
}

struct Button_CustomStyle: View {
    var body: some View {
        Button("Sign In", systemImage: "applelogo") { print("tapped sign in") }
            .buttonStyle(.myButtonStyle)
    }
}

#Preview {
    Button_CustomStyle()
}
