//
//  Link_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct Link_Basics: View {
    var body: some View {
        Link("View Our Terms of Service", destination: URL(string: "https://www.apple.com/kr/")!)
        
        Link("Visit Our Site", destination: URL(string: "https://www.apple.com/kr/")!)
            .environment(\.openURL, OpenURLAction { url in
                print("Open \(url)")
                return .handled
            })
    }
}

#Preview {
    Link_Basics()
}
