//
//  NavigationStack_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/8/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/navigationstack

import SwiftUI

struct NavigationStack_Basics: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Receipe") {
                Text("Receipe Detail View")
            }
            .navigationTitle("NavigationStack")
            .navigationSubtitle("It is a container for your app’s navigation structure.")
        }
    }
}

#Preview {
    NavigationStack_Basics()
}
