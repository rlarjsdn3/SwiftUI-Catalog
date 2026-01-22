//
//  ScrollView_Reader_ProgrammaticScroll.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/22/26.
//

import SwiftUI

struct ScrollView_Reader_ProgrammaticScroll: View {

    private enum AnchorOption: String, CaseIterable, Identifiable {
        case top, center, bottom

        var id: String { rawValue }

        var title: String {
            switch self {
            case .top: return "Top"
            case .center: return "Center"
            case .bottom: return "Bottom"
            }
        }

        var value: UnitPoint {
            switch self {
            case .top: return .top
            case .center: return .center
            case .bottom: return .bottom
            }
        }
    }

    @State private var selectedAnchor: AnchorOption = .center
    @State private var targetText: String = "40"
    @State private var lastScrollID: Int? = nil

    private let items = Array(0...120)

    var body: some View {
        VStack(spacing: 12) {
            header

            controls

            Divider()

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 12) {
                        topSentinel

                        ForEach(items, id: \.self) { id in
                            row(id)
                                .id(id)
                        }

                        bottomSentinel
                    }
                    .padding(.vertical, 16)
                }
                .background(Color.gray.opacity(0.06))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                .onChange(of: lastScrollID) { _, newValue in
                    guard let id = newValue else { return }
                    withAnimation(.snappy) {
                        proxy.scrollTo(id, anchor: selectedAnchor.value)
                    }
                }
                .onSubmit {
                    scrollToTypedID()
                }
                .safeAreaInset(edge: .bottom) {
                    quickActions(proxy: proxy)
                }
            }
        }
        .padding(.vertical)
    }
}

extension ScrollView_Reader_ProgrammaticScroll {

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("ScrollViewReader + Programmatic Scroll")
                .font(.title2.bold())
            Text("scrollTo(_:anchor:)로 특정 아이템/섹션으로 점프하는 패턴을 학습니다.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }

    private var controls: some View {
        VStack(spacing: 10) {
            HStack(spacing: 12) {
                TextField("Target ID (0~120)", text: $targetText)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)

                Button("Go") {
                    scrollToTypedID()
                }
                .buttonStyle(.borderedProminent)
            }

            Picker("Anchor", selection: $selectedAnchor) {
                ForEach(AnchorOption.allCases) { option in
                    Text(option.title)
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal)
    }

    private var topSentinel: some View {
        sentinel("TOP", subtitle: "Tap a button below to jump here")
            .id("TOP")
    }

    private var bottomSentinel: some View {
        sentinel("BOTTOM", subtitle: "Tap a button below to jump here")
            .id("BOTTOM")
    }

    private func sentinel(_ title: String, subtitle: String) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.blue.opacity(0.12))
            .frame(height: 72)
            .overlay {
                VStack(spacing: 4) {
                    Text(title)
                        .font(.headline)
                    Text(subtitle)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal)
    }

    private func row(_ id: Int) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.primary.opacity(0.08))
            .frame(height: 46)
            .overlay {
                HStack {
                    Text("Item \(id)")
                        .font(.system(size: 14, weight: .medium))
                    Spacer()
                    if lastScrollID == id {
                        Text("Target")
                            .font(.caption.weight(.semibold))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.green.opacity(0.25)))
                    }
                }
                .padding(.horizontal, 14)
            }
            .padding(.horizontal)
            .onTapGesture {
                lastScrollID = id
            }
    }
}

extension ScrollView_Reader_ProgrammaticScroll {

    private func scrollToTypedID() {
        let trimmed = targetText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let id = Int(trimmed), items.contains(id) else {
            return
        }
        lastScrollID = id
    }

    private func quickActions(proxy: ScrollViewProxy) -> some View {
        HStack(spacing: 10) {
            Button("Top") {
                withAnimation(.snappy) {
                    proxy.scrollTo("TOP", anchor: .top)
                }
            }
            .buttonStyle(.bordered)

            Button("Middle(60)") {
                lastScrollID = 60
            }
            .buttonStyle(.bordered)

            Spacer()

            Button("Random") {
                lastScrollID = items.randomElement()
            }
            .buttonStyle(.bordered)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial)
    }
}

#Preview {
    ScrollView_Reader_ProgrammaticScroll()
}
