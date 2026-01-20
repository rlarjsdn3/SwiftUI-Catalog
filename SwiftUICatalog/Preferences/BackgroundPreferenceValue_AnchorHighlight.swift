//
//  BackgroundPreferenceValue_AnchorHighlight.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct BackgroundPreference_AnchorHighlight: View {

    var body: some View {
        VStack(spacing: 40) {
            Text("Above")

            TargetView()

            Text("Below")
        }
        .padding()
        .backgroundPreferenceValue(ChildBoundAnchorKey.self) { anchor in
            GeometryReader { proxy in
                if let anchor {
                    let frame = proxy[anchor]

                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.green.opacity(0.18))
                        .frame(
                            width: frame.width + 16,
                            height: frame.height + 16
                        )
                        .position(
                            x: frame.midX,
                            y: frame.midY
                        )
                        .animation(.easeInOut, value: frame)
                }
            }
        }
    }
}

private struct TargetView: View {
    var body: some View {
        Text("Target View")
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(Color.yellow)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .anchorPreference(
                key: ChildBoundAnchorKey.self,
                value: .bounds
            ) { anchor in
                anchor
            }
    }
}

#Preview {
    BackgroundPreference_AnchorHighlight()
}
