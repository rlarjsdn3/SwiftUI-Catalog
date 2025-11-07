//
//  Label_CustomStyle.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/label

import SwiftUI

struct Label_CustomStyle: View {
    var body: some View {
        Label("Lightning", systemImage: "bolt.fill")
            .labelStyle(.redBordered)
    }
}

fileprivate struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}

fileprivate extension LabelStyle where Self == RedBorderedLabelStyle {
    static var redBordered: Self { Self() }
}


#Preview {
    Label_CustomStyle()
}
