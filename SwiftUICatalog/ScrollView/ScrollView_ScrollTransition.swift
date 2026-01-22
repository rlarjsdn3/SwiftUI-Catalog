//
//  ScrollView_ScrollTransition.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/22/26.
//

import SwiftUI

struct ScrollView_ScrollTransition: View {

    private enum DemoStyle: String, CaseIterable, Identifiable {
        case verticalCards
        case horizontalCards

        var id: String { rawValue }

        var title: String {
            switch self {
            case .verticalCards: return "Vertical Cards"
            case .horizontalCards: return "Horizontal Cards"
            }
        }
    }

    @State private var style: DemoStyle = .verticalCards
    @State private var enableBlur: Bool = false
    @State private var enableRotation: Bool = false

    var body: some View {
        VStack(spacing: 12) {
            header
            controls

            Divider()

            Group {
                switch style {
                case .verticalCards:
                    verticalCards
                case .horizontalCards:
                    horizontalCarousel
                }
            }
            .animation(.snappy, value: style)
        }
        .padding(.vertical)
    }
}

extension ScrollView_ScrollTransition {

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("scrollTransition")
                .font(.title2.bold())
            Text("스크롤 중인 뷰의 표시 상태에 따라 변형을 적용합니다.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }

    private var controls: some View {
        VStack(spacing: 10) {
            Picker("Style", selection: $style) {
                ForEach(DemoStyle.allCases) { style in
                    Text(style.title)
                        .tag(style)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

extension ScrollView_ScrollTransition {

    private var verticalCards: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(0..<18, id: \.self) { i in
                    card(title: "Card \(i)", subtitle: "Scroll to see transition")
                        .scrollTransition(.interactive, axis: .vertical) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.65)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.92)
                                .blur(radius: phase.isIdentity ? 0 : 8)
                                .rotationEffect(.degrees(phase.rotationAmount))
                        }
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }

    private var horizontalCarousel: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(0..<12, id: \.self) { i in
                    carouselCard(index: i)
                        .scrollTransition(.interactive, axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.6)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.88)
                                .blur(radius: phase.isIdentity ? 0 : 8)
                                .rotationEffect(.degrees(phase.rotationAmount))
                        }
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 18)
        }
        .background(Color.gray.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(.horizontal)
    }
}

extension ScrollView_ScrollTransition {

    private func card(title: String, subtitle: String) -> some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(Color.blue.opacity(0.18))
            .frame(height: 140)
            .overlay {
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            }
    }

    private func carouselCard(index: Int) -> some View {
        RoundedRectangle(cornerRadius: 18)
            .fill(Color.orange.opacity(0.22))
            .frame(width: 240, height: 160)
            .overlay {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Item \(index)")
                        .font(.headline)
                    Text("Horizontal scrollTransition")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            }
    }
}

extension ScrollTransitionPhase {

    nonisolated var rotationAmount: Double {
        isIdentity ? 0 : 6
    }
}

#Preview {
    ScrollView_ScrollTransition()
}
