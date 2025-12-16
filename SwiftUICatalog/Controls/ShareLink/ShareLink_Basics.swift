//
//  ShareLink_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

struct ShareLink_Basics: View {
    var body: some View {
        ShareLink(item: URL(string: "https://apple.com/kr/")!) {
            Label("Share", systemImage: "square.and.arrow.up")
        }
    }
}

#Preview {
    ShareLink_Basics()
}
