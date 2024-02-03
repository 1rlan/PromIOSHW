//
//  CustomDatePicker.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import SwiftUI

struct CustomDatePicker: View {
    let title: String
    @Binding var selectedDate: Date

    var body: some View {
        DatePicker(title,
           selection: $selectedDate,
           displayedComponents: [.date, .hourAndMinute]
        )
    }
}

#Preview {
    CustomDatePicker(title: "Select date", selectedDate: .constant(.now))
}
