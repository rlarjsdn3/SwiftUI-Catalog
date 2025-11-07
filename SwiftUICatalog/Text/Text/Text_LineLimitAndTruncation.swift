//
//  Text_LineLimitAndTruncation.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text


import SwiftUI

struct Text_LineLimitAndTruncation: View {
    
    var body: some View {
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
            .lineLimit(3)
            .truncationMode(.middle)
    }
}

#Preview {
    Text_LineLimitAndTruncation()
}
