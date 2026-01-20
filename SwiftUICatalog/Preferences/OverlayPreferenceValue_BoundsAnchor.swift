//
//  PreferenceKey_ChildBoundAnchor.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

// 자식 뷰의 Anchor<CGRect>를 전달하기 위한 PreferenceKey
struct ChildBoundAnchorKey: PreferenceKey {
    static var defaultValue: Anchor<CGRect>? = nil

    static func reduce(
        value: inout Anchor<CGRect>?,
        nextValue: () -> Anchor<CGRect>?
    ) {
        value = nextValue() ?? value
    }
}

struct PreferenceKey_ChildFrameAnchor: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Above")

            HighlightChildView()

            Text("Below")
        }
        .padding()
        .overlayPreferenceValue(ChildBoundAnchorKey.self) { anchor in
            GeometryReader { proxy in
                if let anchor {
                    let frame = proxy[anchor]

                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.red, lineWidth: 2)
                        .frame(
                            width: frame.width,
                            height: frame.height
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

private struct HighlightChildView: View {
    var body: some View {
        Text("Target View")
            .padding()
            .background(Color.yellow)
            .anchorPreference(
                key: ChildBoundAnchorKey.self,
                value: .bounds
            ) { anchor in
                anchor
            }
    }
}

#Preview {
    PreferenceKey_ChildFrameAnchor()
}
