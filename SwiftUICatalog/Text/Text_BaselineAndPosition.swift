//
//  Text_BaselineAndPosition.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text


import SwiftUI

struct Text_BaselineAndPosition: View {
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Hello")
                    .offset(y: -10)
                    .border(Color.red)
                Text("Hello")
                    .offset(y: 0)
                    .border(Color.green)
                Text("Hello")
                    .offset(y: 10)
                    .border(Color.blue)
            }
            .background(Color(white: 0.9))
            
            HStack {
                Text("Hello")
                    .baselineOffset(-10)
                    .border(Color.red)
                Text("Hello")
                    .baselineOffset(0)
                    .border(Color.green)
                Text("Hello")
                    .baselineOffset(10)
                    .border(Color.blue)
            }
            .background(Color(white: 0.9))
            
            Text("Position by passing the x and y coordinates")
                .position(x: 350, y: 100)
                .border(Color.gray)
        }
    }
}

#Preview {
    Text_BaselineAndPosition()
}
