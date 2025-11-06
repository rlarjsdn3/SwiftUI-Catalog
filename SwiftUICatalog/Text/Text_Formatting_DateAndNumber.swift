//
//  Text_Formatting_DateAndNumber.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text

import SwiftUI

struct Text_Formatting_DateAndNumber: View {
    @Environment(\.locale) var locale
    
    var now: Date { .now }
    var nowAfter10Sec: Date { now.addingTimeInterval(10) }
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Text(now, style: .date)
                Text(now, style: .time)
                
                Text(now, style: .relative)
                Text(nowAfter10Sec, style: .relative)
                
                Text(now, style: .offset)
                Text(nowAfter10Sec, style: .offset)
                
                Text(now, style: .timer)
                Text(nowAfter10Sec, style: .timer)
                
                Text(now.formatted())
                Text(now.formatted(date: .long, time: .shortened))
                Text(now.formatted(date: .abbreviated, time: .complete))
                
                Text(now.formatted(.dateTime.day().month().year()))
                Text(now.formatted(.dateTime.day(.twoDigits).month(.wide)))
                Text(now.formatted(.dateTime.weekday(.narrow)))
            }
            
            VStack {
                Text(123456789, format: .number)
                Text(123.456789, format: .number)
                Text(123456.789, format: .number.notation(.compactName))
                
                Text(123.456, format: .number.precision(.integerAndFractionLength(integer: 1, fraction: 1)))
                Text(123.456789, format: .number.precision(.integerAndFractionLength(integerLimits: 1..<3, fractionLimits: 2..<4)))
                Text(123456, format: .number.grouping(.never))
                
                Text(123, format: .number.sign(strategy: .always()))
                Text(-123, format: .number)
                
                Text(123.456, format: .number.rounded(increment: 1.0))
                Text(123.456, format: .number.rounded(increment: 10.0))
                Text(123.456, format: .number.rounded(increment: 100.0))
                
                Text(123456.789, format: .number.rounded(rule: .up, increment: 10.0))
                Text(123456.789, format: .number.rounded(rule: .down, increment: 10.0))
                Text(0.1234, format: .number.rounded(rule: .awayFromZero, increment: 0.1))
                Text(0.1234, format: .number.rounded(rule: .toNearestOrAwayFromZero, increment: 0.25))
                Text(0.5555, format: .number.rounded(rule: .toNearestOrEven, increment: 0.1))
                
                Text(123456, format: .currency(code: "KRW"))
                Text(123456, format: .currency(code: "USD"))
                
                Text(99, format: .percent)
            }
        }
    }
}

#Preview {
    Text_Formatting_DateAndNumber()
}
