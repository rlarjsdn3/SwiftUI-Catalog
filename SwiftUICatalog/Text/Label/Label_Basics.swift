//
//  Label_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/label

import SwiftUI

struct Label_Basics: View {
    
    var body: some View {
        Label("Lightning", systemImage: "bolt.fill")
    }
}

#Preview {
    Label_Basics()
}
