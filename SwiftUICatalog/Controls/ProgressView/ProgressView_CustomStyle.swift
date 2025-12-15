//
//  ProgressView_CustomStyle.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

private struct PinkBorderedProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(4)
            .border(.pink, width: 3)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct ProgressView_CustomStyle: View {
    var body: some View {
        VStack {
            ProgressView(value: 0.25) {
                Text("25% progess")
            }
            ProgressView(value: 0.75) {
                Text("75% progress")
            }
        }
        .progressViewStyle(PinkBorderedProgressViewStyle())
    }
}

#Preview {
    ProgressView_CustomStyle()
}
