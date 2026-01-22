//
//  ScrollView_ContentMargins_SafeArea.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/22/26.
//

import SwiftUI

struct ScrollView_ContentMargins_SafeArea: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {

                sectionTitle("1. Default ScrollView")
                defaultExample

                sectionTitle("2. safeAreaPadding")
                safeAreaPaddingExample

                sectionTitle("3. contentMargins")
                contentMarginsExample

                sectionTitle("4. containerRelativeFrame (Cards)")
                containerRelativeFrameExample
            }
        }
    }
}

extension ScrollView_ContentMargins_SafeArea {

    // 기본 ScrollView (safe area 영향 없음)
    private var defaultExample: some View {
        VStack(spacing: 12) {
            ForEach(0..<3, id: \.self) { index in
                cell("Item \(index)")
            }
        }
        .background(Color.blue.opacity(0.08))
    }

    // safeAreaPadding 예제
    // - 시스템 Safe Area를 기준으로 패딩 적용
    private var safeAreaPaddingExample: some View {
        VStack(spacing: 12) {
            ForEach(0..<3, id: \.self) { index in
                cell("Item \(index)")
            }
        }
        .safeAreaPadding(.horizontal, 24)
        .background(Color.green.opacity(0.08))
    }

    // contentMargins 예제
    // - ScrollView 콘첸츠 영역 내부 여백
    private var contentMarginsExample: some View {
        VStack(spacing: 12) {
            ForEach(0..<3, id: \.self) { index in
                cell("Item \(index)")
            }
        }
        .background(Color.brown.opacity(0.08))
        .contentMargins(.horizontal, 24, for: .scrollContent)
    }

    // containerRelativeFrame 예제
    // - 카드 / 페이지 폭을 컨테이너 기준으로 계산
    private var containerRelativeFrameExample: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(0..<5, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.orange.opacity(0.25))
                        .containerRelativeFrame(.horizontal) { length, _ in
                            length * 0.75
                        }
                        .frame(height: 140)
                        .overlay {
                            Text("Card \(index)")
                                .font(.headline)
                        }
                }
            }
        }
    }
}

extension ScrollView_ContentMargins_SafeArea {

    private func cell(_ title: String) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.primary.opacity(0.1))
            .frame(height: 44)
            .overlay {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
            }
    }

    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.title3.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    ScrollView_ContentMargins_SafeArea()
}
