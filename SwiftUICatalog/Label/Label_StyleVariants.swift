//
//  Label_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/label

import SwiftUI

struct Label_StyleVariants: View {
    var body: some View {
        VStack {
            Label("Lightning", systemImage: "bold.fill")
                .labelStyle(.titleOnly)
            
            Label("Lightning", systemImage: "bolt.fill")
                .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    Label_StyleVariants()
}
