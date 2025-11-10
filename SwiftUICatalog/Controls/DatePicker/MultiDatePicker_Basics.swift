//
//  MultiDatePicker_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct MultiDatePicker_Basics: View {
    @State private var dates: Set<DateComponents> = []
    
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    
    var bounds: Range<Date> {
        let start = calendar.date(from: DateComponents(timeZone: timeZone, year: 2022, month: 6, day: 6))!
        let end = calendar.date(from: DateComponents(timeZone: timeZone, year: 2022, month: 6, day: 16))!
        return start ..< end
    }
    
    var body: some View {
        List {
            MultiDatePicker("Dates Available", selection: $dates, in: bounds)
        }
    }
}

#Preview {
    MultiDatePicker_Basics()
        .environment(\.locale, Locale.init(identifier: "zh"))
        .environment(\.calendar
                      , Calendar.init(identifier: .chinese))
        .environment(\.timeZone, TimeZone(abbreviation: "HKT")!)
}
