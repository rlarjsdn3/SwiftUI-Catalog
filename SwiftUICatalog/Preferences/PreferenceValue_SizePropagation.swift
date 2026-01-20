//
//  PreferenceKey_SizePropagation.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

// 자식 뷰의 높이를 부모로 전달하기 위한 PreferenceKey
struct ChildHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(
        value: inout CGFloat,
        nextValue: () -> CGFloat
    ) {
        value = nextValue()
    }
}

struct PreferenceKey_SizePropagation: View {
    @State private var childHeight: CGFloat = 0

    var body: some View {
        VStack(spacing: 16) {
            Text("Child Height: \(Int(childHeight)) pt")
                .font(.headline)

            ChildView()
                .background(Color.blue.opacity(0.1))
        }
        .padding()
        .onPreferenceChange(
            ChildHeightPreferenceKey.self) { value in
                childHeight = value
            }
    }
}

private struct ChildView: View {
    var body: some View {
        Text("This is a child view\nwith dynamic height")
            .padding()
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: ChildHeightPreferenceKey.self,
                            value: proxy.size.height
                        )
                }
            )
    }
}

#Preview {
    PreferenceKey_SizePropagation()
}
