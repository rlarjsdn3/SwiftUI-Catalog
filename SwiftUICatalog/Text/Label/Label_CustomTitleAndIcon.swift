//
//  Label_CustomTitleAndIcon.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/label

import SwiftUI

struct Label_CustomTitleAndIcon: View {
    var body: some View {
        Label {
            Text("KIM KUNWOO")
                .font(.default)
                .foregroundStyle(.primary)
            Text("iOS DEVELOPER")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        } icon: {
            Circle()
                .fill(Color.blue)
                .frame(width: 44, height: 44, alignment: .center)
                .overlay(Text("KKW").font(.caption2))
        }
    }
}

#Preview {
    Label_CustomTitleAndIcon()
}
