//
//  Picker_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/picker

import SwiftUI

fileprivate enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

fileprivate enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}

extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}

struct Picker_Basics: View {
    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        List {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            
            Picker(selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            } label: {
                Text("Flavor")
                Text("Choose your favorite flavor")
            }
            
            Picker("Flavor", selection: $selectedFlavor) {
                // ForEach automatically assigns a tag to the selection views using each option’s id.
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                }
            }
            
            HStack {
                Text("Suggested Topping")
                Spacer()
                Text(selectedFlavor.suggestedTopping.rawValue.capitalized)
                    .foregroundStyle(.secondary)
            }

        }
    }
}

#Preview {
    Picker_Basics()
}
