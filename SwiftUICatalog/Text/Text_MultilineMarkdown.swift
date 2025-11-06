//
//  Text_MultilineMarkdown.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text

import SwiftUI

struct Text_MultilineMarkdown: View {
    
    var body: some View {
        Text(
            markdown: "**Thank you!** Please visit our [website](https://example.com). \\n We _look_ forward to hearing from you *soon.* and maybe a rainbow!"
        )
    }
}

#Preview {
    Text_MultilineMarkdown()
}


fileprivate extension Text {
    
    init?(
        markdown: String,
        options: AttributedString.MarkdownParsingOptions = .init()
    ) {
        guard let attributedString = try? AttributedString(markdown: markdown, options: options)
        else { return nil }
        
        self.init(attributedString)
    }
}
