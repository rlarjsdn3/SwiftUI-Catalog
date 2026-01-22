//
//  ScrollView_Indicators_And_Bounce.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/22/26.
//

import SwiftUI

struct ScrollView_Indicators_And_Bounce: View {

    @State private var showsIndicators: Bool = true
    @State private var bounceMode: BounceMode = .basedOnSize

    var body: some View {
        VStack(spacing: 16) {

            header

            controls

            Divider()

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<5, id: \.self) { index in
                        cell("Item \(index)")
                    }
                }
                .padding(.vertical, 16)
            }
            .scrollIndicators(showsIndicators ? .visible : .hidden)
            .applyBounceBehavior(bounceMode)
            .background(Color.gray.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)
        }
    }
}

extension ScrollView_Indicators_And_Bounce {

    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Scroll Indicator & Bounce")
                .font(.title2.bold())
            Text("scrollIndicators + scrollBounceBehavior 조합을 빠르게 체감하는 예제")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }

    private var controls: some View {
        VStack(spacing: 12) {
            Toggle("Show Indicators", isOn: $showsIndicators)

            Picker("Bounce", selection: $bounceMode) {
                ForEach(BounceMode.allCases) { mode in
                    Text(mode.title)
                        .tag(mode)
                }
            }
            .pickerStyle(.segmented)

            Text(bounceMode.description)
                .font(.footnote)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }

    private func cell(_ title: String) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.primary.opacity(0.08))
            .frame(height: 44)
            .overlay {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
            }
            .padding(.horizontal)
    }
}

extension ScrollView_Indicators_And_Bounce {

    enum BounceMode: String, CaseIterable, Identifiable {
        case basedOnSize
        case always
        case automatic

        var id: String { rawValue }

        var title: String {
            switch self {
            case .basedOnSize: return "BasedOnSize"
            case .always: return "Always"
            case .automatic: return "Automatic"
            }
        }

        var description: String {
            switch self {
            case .basedOnSize:
                return "콘텐츠 크기에 따라 자동으로 바운스가 결정됩니다."
            case .always:
                return "콘텐츠가 작아도 항상 바운스를 허용합니다."
            case .automatic:
                return "바운스 여부를 자동으로 결정합니다."
            }
        }
    }
}

extension View {

    @ViewBuilder
    func applyBounceBehavior(_ mode: ScrollView_Indicators_And_Bounce.BounceMode) -> some View {
        if #available(iOS 16.4, *) {
            switch mode {
            case .basedOnSize:
                self.scrollBounceBehavior(.basedOnSize)
            case .always:
                self.scrollBounceBehavior(.always)
            case .automatic:
                self.scrollBounceBehavior(.automatic)
            }
        } else {
            self
        }
    }
}

#Preview {
    ScrollView_Indicators_And_Bounce()
}

