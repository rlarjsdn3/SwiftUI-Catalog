//
//  Text_ColorAndStyle.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text


import SwiftUI

struct Text_ColorAndStyle: View {
    var body: some View {
        HStack {
            VStack {
                Text("Blue")
                    .foregroundStyle(.blue)
                
                Text("Brown")
                    .foregroundStyle(.brown)
                
                Text("Indigo")
                    .foregroundStyle(.indigo)
            }
            
            VStack {
                Text("Bold")
                    .bold()
                
                Text("Italic")
                    .italic()
                
                Text("\(Text("Bold").bold()) \(Text("Italic").italic())")
            }
        }
    }
}

#Preview {
    Text_ColorAndStyle()
}
