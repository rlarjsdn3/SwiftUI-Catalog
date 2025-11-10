//
//  DatePicker_RangeSelection.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct DatePicker_RangeSelection: View {
    @State private var date = Date()
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31)
        return calendar.date(from: startComponents)!
            ...
            calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        DatePicker(
            "Start Date",
            selection: $date,
            in: dateRange,
            displayedComponents: [.date, .hourAndMinute]
        )
    }
}

#Preview {
    DatePicker_RangeSelection()
}
