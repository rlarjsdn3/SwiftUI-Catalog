//
//  NavigationStack_ViewBasedNavigation.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/8/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/navigationstack

import SwiftUI

private enum ColorAsset: CaseIterable, Identifiable {
    case mint, red
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .mint: Color.mint
        case .red: Color.red
        }
    }
    
    var description: String {
        switch self {
        case .mint: return "Mint"
        case .red: return "Red"
        }
    }
}

struct NavigationStack_ViewBasedNavigation: View {
    var body: some View {
        NavigationStack {
            List(ColorAsset.allCases) { type in
                NavigationLink {
                    ColorDetail(color: type.color, text: type.description)
                } label: {
                    Text(type.description)
                }
            }
            .navigationTitle("View-Based Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct ColorDetail: View {
    var color: Color
    var text: String
    
    var body: some View {
        Text(text)
        color
    }
}

#Preview {
    NavigationStack_ViewBasedNavigation()
}
