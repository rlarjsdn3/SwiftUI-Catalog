//
//  Picker_PalleteSelectionEffect.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//

import SwiftUI

fileprivate enum Pallette: String, CaseIterable, Identifiable {
    case red, green, blue, orange
    var id: Self { self }
    
    var tint: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .orange: return .orange
        }
    }
}

struct Picker_PalleteSelectionEffect: View {
    @State private var selection: Pallette = .red
    
    var body: some View {
        List {
            HStack {
                Menu {
                    Picker("Tags", selection: $selection) {
                        ForEach(Pallette.allCases) { palette in
                            Image(systemName: "tag")
                                .tint(palette.tint)
                                .tag(palette)
                        }
                    }
                    .pickerStyle(.palette)
                    .paletteSelectionEffect(.symbolVariant(.fill))
                } label: {
                    Text("Palettes")
                }
                
                Spacer()
                
                Circle()
                    .fill(selection.tint)
                    .frame(width: 24, height: 24)
            }
        }
    }
}

#Preview {
    Picker_PalleteSelectionEffect()
}
