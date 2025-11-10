//
//  DatePicker_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct DatePicker_StyleVariants: View {
    @State private var date = Date()
    
    var body: some View {
        List {
            DatePicker(
                "Compact",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.compact)
            
            DatePicker(
                "Automatic",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.automatic)
            
            DatePicker(
                "Graphical",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            
            DatePicker(
                "Wheel",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.wheel)
        }
    }
}

#Preview {
    DatePicker_StyleVariants()
}
