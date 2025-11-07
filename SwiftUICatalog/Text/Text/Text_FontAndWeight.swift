//
//  Text_FontAndWeight.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text

import SwiftUI

struct Text_FontAndWeight: View {
    
    var body: some View {
        HStack {
            VStack {
                Text("Caption 2")
                    .font(.caption2)
                
                Text("Caption")
                    .font(.caption)
                
                Text("Footnote")
                    .font(.footnote)
                
                Text("Callout")
                    .font(.callout)
                
                Text("Subheadline")
                    .font(.subheadline)
                
                Text("Body")
                    .font(.default)
                
                Text("Headline")
                    .font(.headline)
                
                Text("Title 3")
                    .font(.title3)
                
                Text("Title 2")
                    .font(.title2)
                
                Text("Title")
                    .font(.title)
                
                Text("Large Title")
                    .font(.largeTitle)
            }
            
            VStack {
                Text("Ultra Thin")
                    .fontWeight(.ultraLight)
                
                Text("Thin")
                    .fontWeight(.thin)
                
                Text("Light")
                    .fontWeight(.light)
                
                Text("Regular")
                    .fontWeight(.regular)
                
                Text("Medium")
                    .fontWeight(.medium)
                
                Text("Bold")
                    .fontWeight(.bold)
                
                Text("Heavy")
                    .fontWeight(.heavy)
                
                Text("Black")
                    .fontWeight(.black)
            }
        }
    }
}


#Preview {
    Text_FontAndWeight()
}
