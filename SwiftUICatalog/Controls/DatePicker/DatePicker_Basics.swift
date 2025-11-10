//
//  DatePicker_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct DatePicker_Basics: View {
    @State private var date = Date()
    
    var body: some View {
        List {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            
            DatePicker(selection: $date) {
                Text("Start Date")
                Text("Select the starting date for the event")
            }
        }
    }
}

#Preview {
    DatePicker_Basics()
}
