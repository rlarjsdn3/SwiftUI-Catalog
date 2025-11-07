//
//  Text_Attributed.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text

import SwiftUI

struct Text_Attributed: View {
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Regular")
                Text("Italics") { $0.font = .system(size: 17).italic() }
                Text("Bold") { $0.font = .system(size: 17).bold() }
                Text("Strikethrough") { $0.strikethroughStyle = Text.LineStyle(pattern: .solid, color: .red) }
                Text("Code") { $0.font = .system(.title, design: .monospaced, weight: .ultraLight) }
                Text("Foreground Color") { $0.foregroundColor = .green }
                Text("Background Color") { $0.backgroundColor = .red }
                Text("Underline") { $0.underlineStyle = Text.LineStyle(pattern: .dot, color: .indigo) }
            }
            
            VStack {
                Text("Kern") { $0.kern = 10 }
                Text("Tracking") { $0.tracking = 30 }
            }
            
            VStack {
                Text("Baseline Offset") { $0.baselineOffset = 30 }
                Text("Link") { $0.link = URL(string: "https://apple.com") }
            }
            
            Text("Some Attributed String") {
                $0.foregroundColor = .mint
                if let range = $0.range(of: "Attributed") {
                    $0[range].foregroundColor = .red
                }
            }
            
        }
    }
}

#Preview {
    Text_Attributed()
}


fileprivate extension Text {
    
    init(_ string: String, configure: (inout AttributedString) -> Void) {
        var attributedString = AttributedString(string)
        configure(&attributedString)
        self.init(attributedString)
    }
}
