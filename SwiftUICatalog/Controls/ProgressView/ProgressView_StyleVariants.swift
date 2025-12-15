//
//  ProgressView_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct ProgressView_StyleVariants: View {
    @State private var progress = 0.6
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(.linear)
            // On platforms other than macOS, the circular style may appear as an indeterminate indicator instead.
            ProgressView(value: progress)
                .progressViewStyle(.circular)
        }
    }
}

#Preview {
    ProgressView_StyleVariants()
}
